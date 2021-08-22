//
//  RegisterResponse.swift
//  HamHumApp
//
//  Created by ALEMDAR on 22.08.2021.
//

import Foundation

struct RegisterResponse: Decodable {
    let status: Bool?
    let message: String?
    let user: User?
}
