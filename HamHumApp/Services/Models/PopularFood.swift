//
//  PopularFood.swift
//  HamHumApp
//
//  Created by ALEMDAR on 20.08.2021.
//

import Foundation

struct PopularFood: Decodable {
    let id: Int?
    let name: String?
    let image: String?
    let price: Double?
    let subtitle: String?
    let currency: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case price
        case subtitle = "popular_subtitle"
        case currency
    }
}
