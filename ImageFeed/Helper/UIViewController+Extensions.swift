//
//  UIViewController+Extensions.swift
//  ImageFeed
//
//  Created by Kirill on 13.02.2023.
//

import UIKit

extension UIViewController {
    func showErrorAlert() {
        let alert = UIAlertController(
            title: "Что-то пошло не так(",
            message: "Не удалось войти в систему",
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: "Ок", style: .cancel)

        alert.addAction(action)

        self.present(alert, animated: true, completion: nil)
    }
}
