//
//  ProfileViewPresenter.swift
//  ImageFeed
//
//  Created by Kirill on 13.02.2023.
//
import UIKit

public protocol ProfileViewPresenterProtocol {
    var view: ProfileViewControllerProtocol? {get set}
    func viewDidLoad()
    func makeAlert() -> UIAlertController
}

final class ProfileViewPresenter: ProfileViewPresenterProtocol {
    weak var view: ProfileViewControllerProtocol?
    private let profileService = ProfileService.shared
    private var profileImageServiceObserver: NSObjectProtocol?
    
    func viewDidLoad() {
        profileImageServiceObserver = NotificationCenter.default
                    .addObserver(
                        forName: ProfileImageService.DidChangeNotification,
                        object: nil,
                        queue: .main
                    ) { [weak self] _ in
                        guard let self = self else { return }
                        self.view?.updateAvatar()
                    }
        view?.updateAvatar()
        
    }
    
    func makeAlert() -> UIAlertController {
        let alert = UIAlertController(
            title: "Пока, пока!",
            message: "Уверены, что хотите выйти?",
            preferredStyle: .alert
        )
        let cancelAction = UIAlertAction(title: "Нет", style: .cancel)
        let confirmAction = UIAlertAction(title: "Да", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.view?.logout()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        return alert
    }
    
}
