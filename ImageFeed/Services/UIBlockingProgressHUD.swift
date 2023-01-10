//
//  UIBlockingProgressHUD.swift
//  ImageFeed
//
//  Created by Kirill on 07.01.2023.
//

import Foundation
import UIKit
import ProgressHUD

final class UIBlockingProgressHUD {
    static let shared = UIBlockingProgressHUD()
    
    private init() {}
    
    private static var window: UIWindow? {
        return UIApplication.shared.windows.first
    }
    
    static func show() {
        window?.isUserInteractionEnabled = false
        ProgressHUD.show()
    }
    
    static func dismiss() {
        window?.isUserInteractionEnabled = true
        ProgressHUD.dismiss()
    }
}
