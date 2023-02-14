//
//  ImagesListPresenter.swift
//  ImageFeed
//
//  Created by Kirill on 13.02.2023.
//

import Foundation

protocol ImagesListPresenterProtocol {
    var view: ImagesListViewControllerProtocol? { get set }
    func viewDidLoad()
}

final class ImagesListPresenter: ImagesListPresenterProtocol {
    weak var view: ImagesListViewControllerProtocol?
    private var imageListServiceObserver: NSObjectProtocol?
    private let imageListService = ImageListService.shared
    
    
    func viewDidLoad() {

        imageListServiceObserver = NotificationCenter.default
            .addObserver(
                forName: ImageListService.didChangeNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                guard let self = self else { return }
                self.view?.updateTableViewAnimated()
            }
        imageListService.fetchPhotosNextPage()
    }
}


