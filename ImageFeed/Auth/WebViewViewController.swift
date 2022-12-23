//
//  WebViewViewController.swift
//  ImageFeed
//
//  Created by Kirill on 15.12.2022.
//

import Foundation
import UIKit
import WebKit


protocol WebViewViewControllerDelegate: AnyObject {
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String)
    func webViewViewControllerDidCancel(_ vc: WebViewViewController)
}

final class WebViewViewController: UIViewController {
    
    @IBOutlet private var webView: WKWebView!
    @IBAction private func didTapBackButton(_ sender: Any?) {
        delegate?.webViewViewControllerDidCancel(self)
    }
    @IBOutlet private var progressView: UIProgressView!
    
    weak var delegate: WebViewViewControllerDelegate?
    private let unsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"
    
    override func viewDidLoad() {
            webView.navigationDelegate = self
            let oauthLink = getOauthLink()
            let request = URLRequest(url: oauthLink)
            webView.load(request)
            updateProgress()
        }

        private func getOauthLink() -> URL {
            var urlComponents = URLComponents(string: AuthorizeURL)!
            urlComponents.queryItems = [
               URLQueryItem(name: "client_id", value: AccessKey),
               URLQueryItem(name: "redirect_uri", value: RedirectURI),
               URLQueryItem(name: "response_type", value: "code"),
               URLQueryItem(name: "scopes", value: AccessScope)
             ]
            return urlComponents.url!
        }


        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            webView.addObserver(
                self,
                forKeyPath: #keyPath(WKWebView.estimatedProgress),
                options: .new,
                context: nil)
            updateProgress()
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), context: nil)
        }


        override func observeValue(
            forKeyPath keyPath: String?,
            of object: Any?,
            change: [NSKeyValueChangeKey : Any]?,
            context: UnsafeMutableRawPointer?
        ) {
            if keyPath == #keyPath(WKWebView.estimatedProgress) {
                updateProgress()
            } else {
                super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            }
        }

        private func updateProgress() {
            progressView.progress = Float(webView.estimatedProgress)
            progressView.isHidden = fabs(webView.estimatedProgress - 1.0) <= 0.0001
        }
    }

    // MARK: - WKNavigationDelegate
    extension WebViewViewController: WKNavigationDelegate {
        private func code(from navigationAction: WKNavigationAction) -> String? {
            if
                let url = navigationAction.request.url,
                let urlComponents = URLComponents(string: url.absoluteString),
                urlComponents.path == NativePath,
                let items = urlComponents.queryItems,
                let codeItem = items.first(where: { $0.name == "code" })
            {
                return codeItem.value
            }
            return nil
        }

        func webView(
            _ webView: WKWebView,
            decidePolicyFor navigationAction: WKNavigationAction,
            decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
        ) {
            if let code = code(from: navigationAction) {
                delegate?.webViewViewController(self, didAuthenticateWithCode: code)
                decisionHandler(.cancel)
            } else {
                decisionHandler(.allow)
            }
        }
    }
