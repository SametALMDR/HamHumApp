//
//  FoodDetail.swift
//  HamHumApp
//
//  Created by ALEMDAR on 22.08.2021.
//

import Foundation

struct FoodDetail: Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let image: String?
    let price: Double?
    let rate: Double?
    let rate_count: Int?
    let addons: [FoodAddon]?
    let currency: String?
}

struct FoodAddon: Decodable {
    let id: Int?
    let name: String?
    let price: Double?
}
