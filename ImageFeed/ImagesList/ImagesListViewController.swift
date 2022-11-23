//
//  ViewController.swift
//  ImageFeed
//
//  Created by Kirill on 18.11.2022.
//

import UIKit

class ImagesListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var photosName = [String]()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        photosName = Array(0..<20).map{ "\($0)" }
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
}

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath) // 1
            
            guard let imageListCell = cell as? ImagesListCell else {
                return UITableViewCell()
            }
            
            configCell(for: imageListCell, with: indexPath)
            return imageListCell
        }
}

extension ImagesListViewController {
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        guard let image = UIImage(named: photosName[indexPath.row]) else {
            return
        }
        cell.CellImage.image = image
        cell.CellDate.text = dateFormatter.string(from: Date())
        
        let isLike = indexPath.row % 2 == 0
        let likeImage = isLike ? UIImage(named: "Like_button_on") : UIImage(named: "Like_button_off")
        cell.LikeButton.setImage(likeImage, for: .normal)
    }
}

extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
}