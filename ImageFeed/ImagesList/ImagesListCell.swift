//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Kirill on 23.11.2022.
//

import Foundation
import UIKit

final class ImagesListCell: UITableViewCell {

    static let reuseIdentifier = "ImagesListCell"
    
    @IBOutlet weak var CellImage: UIImageView!
    @IBOutlet weak var LikeButton: UIButton!
    @IBOutlet weak var CellDate: UILabel!
}
