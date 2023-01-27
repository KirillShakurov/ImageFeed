//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Kirill on 01.12.2022.

//import UIKit
//import Kingfisher
//
//final class ProfileViewController: UIViewController {
//    private let storageToken = OAuth2TokenStorage()
//    private let profileService = ProfileService.shared
//    private var profileImageServiceObserver: NSObjectProtocol?
//
//    private lazy var avatarImageView: UIImageView = {
//        let imageView = UIImageView(image: UIImage(named: "user_pick"))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//    private var nameLabel: UILabel!
//    private var loginLabel: UILabel!
//    private var descriptionLabel: UILabel!
//    private var logoutButton: UIButton!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = UIColor(named: "YP Black")
//        createProfileImageAndLogin()
//        createProfileDescription()
//        exitButton()
//        updateProfileDetails(profile: profileService.profile)
//
//        profileImageServiceObserver = NotificationCenter.default.addObserver(
//                forName: ProfileImageService.DidChangeNotification,
//                object: nil,
//                queue: .main) { [weak self] _ in
//                guard let self = self else { return }
//                self.updateAvatar()
//            }
//        updateAvatar()
//    }
//
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
//
//    private func updateAvatar() {
//        guard let profileImageURL = ProfileImageService.shared.avatarURL,
//              let url = URL(string: profileImageURL)
//        else { return }
//        let cache = ImageCache.default
//        cache.clearMemoryCache()
//        cache.clearDiskCache()
//
//        let processor = RoundCornerImageProcessor(cornerRadius: avatarImageView.frame.width)
//        avatarImageView.kf.indicatorType = .activity
//        avatarImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder.png"), options: [.processor(processor)]) { result in
//            switch result {
//            case .success(let value):
//                print("Аватарка \(value.image) была успешно загружена и заменена в профиле")
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//
//    private func updateProfileDetails(profile: Profile) {
//        nameLabel.text = profile.name
//        loginLabel.text = profile.login
//        descriptionLabel.text = profile.bio
//    }
//
//    private func createProfileImageAndLogin() {
//        let profileImage = UIImage(named: "user_pick")
//        let profileImageView = UIImageView(image: profileImage)
//        profileImageView.tintColor = UIColor(named: "YP Gray")
//        profileImageView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(profileImageView)
//        self.avatarImageView = profileImageView
//
//        let nameLabel = UILabel()
//        nameLabel.text = "Екатерина Новикова"
//        nameLabel.font = UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.bold)
//        nameLabel.textColor = UIColor(named: "YP White")
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(nameLabel)
//        self.nameLabel = nameLabel
//
//        let loginLabel = UILabel()
//        loginLabel.text = "@eva_elfie"
//        loginLabel.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)
//        loginLabel.textColor = UIColor(named: "YP Gray")
//        loginLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(loginLabel)
//        self.loginLabel = loginLabel
//
//        NSLayoutConstraint.activate([
//            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
//            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            profileImageView.widthAnchor.constraint(equalToConstant: 70),
//            profileImageView.heightAnchor.constraint(equalToConstant: 70),
//            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
//            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
//            loginLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
//            loginLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
//            loginLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
//        ])
//    }
//
//    private func createProfileDescription() {
//
//        let description = UILabel()
//        description.text = "Hello, world!"
//        description.textColor = UIColor(named: "YP White")
//        description.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(description)
//        self.descriptionLabel = description
//
//        NSLayoutConstraint.activate([
//            description.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 8),
//            description.leadingAnchor.constraint(equalTo: self.loginLabel.leadingAnchor),
//            description.trailingAnchor.constraint(equalTo: self.loginLabel.trailingAnchor),
//        ])
//    }
//
//    private func exitButton() {
//        let exitButton = UIButton.systemButton(
//            with: UIImage(named: "exit_profile_button")!,
//            target: self,
//            action: #selector(Self.didTapLogoutButton))
//        exitButton.tintColor = UIColor(named: "YP Red")
//        exitButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(exitButton)
//        self.logoutButton = exitButton
//
//        NSLayoutConstraint.activate([
//            exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            exitButton.centerYAnchor.constraint(equalTo: self.avatarImageView.centerYAnchor),
//        ])
//    }
//
//}
//extension ProfileViewController {
//
//    private func updateProfileDetails(profile: Profile?) {
//        guard let profile = profile else { return }
//        loginLabel.text = profile.login
//        nameLabel.text = profile.name
//        descriptionLabel.text = profile.bio
//    }
//}
//
////MARK: - LogoutAction
//extension ProfileViewController {
//    private func prepareAction() {
//        logoutButton.addTarget(
//            self,
//            action: #selector(logoutPressed),
//            for: .touchUpInside
//        )
//    }
//
//    @objc private func logoutPressed() {
//        OAuth2TokenStorage().clearToken()
//        WebViewViewController.clean()
//        tabBarController?.dismiss(animated: true)
//        guard let window = UIApplication.shared.windows.first else { fatalError("Invalid Configuration") }
//        window.rootViewController = SplashViewController()
//    }
//}


import UIKit
import Kingfisher

final class ProfileViewController: UIViewController {
    private let profileService = ProfileService.shared
    private var profileImageServiceObserver: NSObjectProtocol?

    private let userProfileImage: UIImageView = {
        let imageView = UIImageView(image: UIImage.asset(ImageAsset.userPick))

        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 35
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    private let logoutButton: UIButton = {
        let button = UIButton()

        button.tintColor = .red
        button.setImage(UIImage.asset(ImageAsset.exitProfileButton), for: .normal)
        return button
    }()

    private let profileNameLabel: UILabel = {
        let label = UILabel()

        label.text = "Екатерина новикова"
        label.textColor = UIColor.asset(ColorAsset.ypWhite)
        label.font =  UIFont.asset(FontAsset.ysDisplayRegular, size: 23)
        return label
    }()

    private let loginNameLabel: UILabel = {
        let label = UILabel()

        label.text = "@ekaterina_nov"
        label.textColor = UIColor.asset(ColorAsset.ypGray)
        label.font = UIFont.asset(FontAsset.ysDisplayRegular, size: 13)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()

        label.text = "Hello World"
        label.textColor = UIColor.asset(ColorAsset.ypWhite)
        label.font = UIFont.asset(FontAsset.ysDisplayRegular, size: 13)
        return label
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        layoutComponents()
        prepareAction()
        observeAvatarChanges()
        updateProfileDetails(profile: profileService.profile)
    }
}


// MARK: - Notification
extension ProfileViewController {
    private func observeAvatarChanges() {
        profileImageServiceObserver = NotificationCenter.default
                    .addObserver(
                        forName: ProfileImageService.DidChangeNotification,
                        object: nil,
                        queue: .main
                    ) { [weak self] _ in
                        guard let self = self else { return }
                        self.updateAvatar()
                    }
                updateAvatar()
    }

    private func updateAvatar() {
        guard
             let profileImageURL = ProfileImageService.shared.avatarURL,
             let url = URL(string: profileImageURL)
         else { return }

        userProfileImage.kf.setImage(with: url,
                                     placeholder: UIImage(named: "stub"),
                                     options: [
                                        .transition(.fade(1)),
                                        .cacheOriginalImage
                                     ])
     }
}

//MARK: - LogoutAction
extension ProfileViewController {
    private func prepareAction() {
        logoutButton.addTarget(
            self,
            action: #selector(logoutPressed),
            for: .touchUpInside
        )
    }

    @objc private func logoutPressed() {
        OAuth2TokenStorage().clearToken()
        WebViewViewController.clean()
        tabBarController?.dismiss(animated: true)
        guard let window = UIApplication.shared.windows.first else { fatalError("Invalid Configuration") }
        window.rootViewController = SplashViewController()
    }
}


extension ProfileViewController {
    private func layoutComponents() {
        view.backgroundColor = UIColor(named: "YP Black")

        let vStack = UIStackView()

        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.alignment = .leading
        vStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(vStack)


        let hStack = UIStackView()

        hStack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        hStack.isLayoutMarginsRelativeArrangement = true
        hStack.axis = .horizontal
        hStack.distribution = .equalSpacing
        hStack.alignment = .center
        hStack.translatesAutoresizingMaskIntoConstraints = false

        hStack.addArrangedSubview(userProfileImage)
        hStack.addArrangedSubview(logoutButton)

        vStack.addArrangedSubview(hStack)
        vStack.addArrangedSubview(profileNameLabel)
        vStack.addArrangedSubview(loginNameLabel)
        vStack.addArrangedSubview(descriptionLabel)




        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            vStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            vStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            hStack.widthAnchor.constraint(equalTo: vStack.widthAnchor),
            userProfileImage.widthAnchor.constraint(equalToConstant: 70),
            userProfileImage.heightAnchor.constraint(equalTo: userProfileImage.widthAnchor),        ])
    }
}

// MARK: - Update Profile data
extension ProfileViewController {

    private func updateProfileDetails(profile: Profile?) {
        guard let profile = profile else { return }
        loginNameLabel.text = profile.login
        profileNameLabel.text = profile.name
        descriptionLabel.text = profile.bio
    }
}
