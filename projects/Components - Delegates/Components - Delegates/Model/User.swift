//
//  User.swift
//  Components - Delegates
//
//  Created by Agah Berkin Güler on 1.04.2024.
//

import Foundation

struct User: Decodable{
    let name: String?
    let username: String?
    let email: String?
    let company: Company?
}

struct Company: Decodable {
    let name: String?
}
