//
//  ProfileImage.swift
//  ImageFeed
//
//  Created by Kirill on 24.01.2023.
//

import Foundation

struct ProfileImage: Codable {
    let small: String?
    let medium: String?
    let large: String?

    var image: String? { large ?? medium ?? small }
}
