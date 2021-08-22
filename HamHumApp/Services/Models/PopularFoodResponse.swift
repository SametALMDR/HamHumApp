//
//  PopularFoodResponse.swift
//  HamHumApp
//
//  Created by ALEMDAR on 21.08.2021.
//

import Foundation

struct PopularFoodResponse: Decodable {
    let status: Bool?
    let message: String?
    let foods: [PopularFood]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case foods = "popular_foods"
    }
}
