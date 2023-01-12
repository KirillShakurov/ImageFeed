//
//  OAuth2Service.swift
//  ImageFeed
//
//  Created by Kirill on 19.12.2022.
//

import Foundation

final class OAuth2Service {
    static let shared = OAuth2Service()
    private let urlSession = URLSession.shared
    private var task: URLSessionTask?
    private var lastCode: String?
    
    private enum NetworkError: Error {
        case codeError
    }
    
    func fetchAuthToken(code: String, completion: @escaping (Result<String, Error>) -> Void) {
        assert(Thread.isMainThread)
        guard lastCode != code else { return }
        task?.cancel()
        lastCode = code
        let request = makeRequest(code: code)
        let session = urlSession
        let task = session.objectTask(for: request) { [weak self] (result: Result<OAuthTokenResponseBody, Error>) in
            switch result {
            case .success(let decodedObject):
                completion(.success(decodedObject.accessToken))
            case .failure(let error):
                completion(.failure(error))
            }
            self?.task = nil
        }
        self.task = task
        task.resume()
    }
    
    private func makeRequest(code: String) -> URLRequest {
        var urlComponents = URLComponents(string: tokenURL)!
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: accessKey),
            URLQueryItem(name: "client_secret", value: secretKey),
            URLQueryItem(name: "redirect_uri", value: redirectURI),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "grant_type", value: "authorization_code"),
        ]
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        return request
    }
}
