//
//  UIFont+Extension.swift
//  ImageFeed
//
//  Created by Kirill on 25.01.2023.
//

import UIKit

extension UIFont {
    static func asset(_ name: FontAsset, size: CGFloat) -> UIFont {
        return UIFont(name: name.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
