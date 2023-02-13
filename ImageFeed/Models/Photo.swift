//
//  Photos.swift
//  ImageFeed
//
//  Created by Kirill on 22.01.2023.
//

import Foundation
import UIKit

struct Photo {
    let id: String
    let size: CGSize
    let createdAt: Date
    let welcomeDescription: String?
    let thumbImageURL: URL
    let largeImageURL: URL
    var isLiked: Bool
}
