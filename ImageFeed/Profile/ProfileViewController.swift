//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Kirill on 01.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {

//    @IBOutlet private var userImageView: UIImageView!
//    @IBOutlet private var logoutButton: UIButton!
//    
//    @IBOutlet private var nameLabel: UILabel!
//    @IBOutlet private var niknameLabel: UILabel!
//    @IBOutlet private var descriptionLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: profileImage
        let profileImage = UIImage(named: "userpick")
        let imageView = UIImageView(image: profileImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.layer.cornerRadius = 35
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        
        
        //MARK: userLabel
        let userLabel = UILabel()
        userLabel.text = "Екатерина Новикова"
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userLabel)
        userLabel.textColor = UIColor(named: "YP White")
        userLabel.font = UIFont(name: "YSDisplay-Bold", size: 23)
        userLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        userLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
     
        
        //MARK: niknameLabel
        let niknameLabel = UILabel()
        niknameLabel.text = "@ekaterina_nov"
        niknameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(niknameLabel)
        niknameLabel.textColor = UIColor(named: "YP Gray")
        niknameLabel.font = UIFont(name: "YSDisplay-Medium", size: 13)
        niknameLabel.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 8).isActive = true
        niknameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
       
        
        //MARK: descriptionLabel
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Hello, world!"
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        descriptionLabel.textColor = UIColor(named: "YP White")
        descriptionLabel.topAnchor.constraint(equalTo: niknameLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        
        //MARK: logoutButton
        let logoutButton = UIButton.systemButton(
            with: UIImage(named: "arrow_forward")!,
            target: self,
            action: #selector(didTapLogoutButton))
        logoutButton.tintColor = UIColor(named: "YP Red")
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)
        logoutButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        
    }
    @objc
    private func didTapLogoutButton() {
        print("logout")
    }
}
