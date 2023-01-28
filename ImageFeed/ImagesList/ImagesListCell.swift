//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Kirill on 23.11.2022.
//

import UIKit

protocol ImagesListCellDelegate: AnyObject {
    func imageListCellDidTapLike(_ cell: ImagesListCell)
    func reloadView(_ cell: ImagesListCell)
}

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!

    weak var delegate: ImagesListCellDelegate?

    @IBAction private func likeButtonClicked() {
        delegate?.imageListCellDidTapLike(self)
    }
    
    private func reloadView() {
        delegate?.reloadView(self)
    }

    public func configure(from photo: Photo) {
        cellImage.kf.indicatorType = .activity
        cellImage.kf.setImage(with: photo.thumbImageURL)
        cellImage.kf.setImage(with: photo.thumbImageURL){result in self.reloadView()}
        dateLabel.text = DateFormatter().displayFormat.string(from: photo.createdAt)
        setIsLiked(isLiked: photo.isLiked)
    }
    

    override func prepareForReuse() {
        super.prepareForReuse()
        cellImage.kf.cancelDownloadTask()
    }

    public func setIsLiked(isLiked: Bool) {
        let likeImage = isLiked ? UIImage(named: "Like_button_on") : UIImage(named: "Like_button_off")
        likeButton.setImage(likeImage, for: .normal)
    }
}




