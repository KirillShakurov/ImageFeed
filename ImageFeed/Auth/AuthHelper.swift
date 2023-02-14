//
//  AuthHelper.swift
//  ImageFeed
//
//  Created by Kirill on 08.02.2023.
//

import Foundation

protocol AuthHelperProtocol {
    func authRequest() -> URLRequest
    func code(from url: URL) -> String?
} 
