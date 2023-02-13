//
//  Constants.swift
//  ImageFeed
//
//  Created by Kirill on 15.12.2022.
//

import Foundation

let baseUrl = "https://api.unsplash.com"
let AccessKey = "J4js66um9v6l7Jgku1rzp6uzslSxHYI_J1piTWd4DKU"
let SecretKey = "xKTid7OKbczAH1EeCBPJehYovgUIzDiO1wNQW23Nvek"
let RedirectURI = "urn:ietf:wg:oauth:2.0:oob"
let AccessScope = "public+read_user+write_likes"
let DefaultBaseURL = URL(string: "https://api.unsplash.com")!
let AuthorizeURL = "https://unsplash.com/oauth/authorize"
let nativePath = "/oauth/authorize/native"
let tokenURL = "https://unsplash.com/oauth/token"
let profileURL = "\(baseUrl)/me"
let profileImageURL = "\(baseUrl)/users"
let photoUrl = "\(baseUrl)/photos"

struct AuthConfiguration {
    let accessKey: String
    let secretKey: String
    let redirectURI: String
    let accessScope: String
    let defaultBaseURL: URL
    let authURLString: String
    
    init(accessKey: String, secretKey: String, redirectURI: String, accessScope: String, authURLString: String, defaultBaseURL: URL) {
        self.accessKey = accessKey
        self.secretKey = secretKey
        self.redirectURI = redirectURI
        self.accessScope = accessScope
        self.defaultBaseURL = defaultBaseURL
        self.authURLString = authURLString
    }
    
    static var standard: AuthConfiguration {
        return AuthConfiguration(accessKey: AccessKey,
                                 secretKey: SecretKey,
                                 redirectURI: RedirectURI,
                                 accessScope: AccessScope,
                                 authURLString: AuthorizeURL,
                                 defaultBaseURL: DefaultBaseURL)
    }
}



