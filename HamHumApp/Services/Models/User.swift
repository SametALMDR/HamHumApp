//
//  User.swift
//  HamHumApp
//
//  Created by ALEMDAR on 22.08.2021.
//

import Foundation

struct User: Decodable {
    let id: Int?
    let name: String?
    let surname: String?
    let username: String?
    let email: String?
    let image: String?
    let token: String?
}
