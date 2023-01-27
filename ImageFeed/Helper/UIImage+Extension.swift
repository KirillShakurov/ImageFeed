//
//  UIImage+Extension.swift
//  ImageFeed
//
//  Created by Kirill on 25.01.2023.
//

import UIKit

extension UIImage {
    static func asset(_ name: ImageAsset) -> UIImage {
        guard let image = UIImage(named: name.rawValue) else {
            fatalError("Empty asset with name \(name.rawValue)")
        }
        return image
    }
}
