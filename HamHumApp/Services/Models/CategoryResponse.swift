//
//  CategoryResponse.swift
//  HamHumApp
//
//  Created by ALEMDAR on 20.08.2021.
//

import Foundation

struct CategoryResponse: Decodable {
    let status: Bool?
    let message: String?
    let categories: [Category]?
}
