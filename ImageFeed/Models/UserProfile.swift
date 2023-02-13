//
//  UserProfile.swift
//  ImageFeed
//
//  Created by Kirill on 24.01.2023.
//

import Foundation

struct UserProfile: Codable {
    let profileImage: ProfileImage?

    enum CodingKeys: String, CodingKey {
        case profileImage = "profile_image"
    }
}
