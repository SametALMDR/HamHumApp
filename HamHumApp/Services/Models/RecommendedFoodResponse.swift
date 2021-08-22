//
//  RecommendedFoodResponse.swift
//  HamHumApp
//
//  Created by ALEMDAR on 21.08.2021.
//

import Foundation

struct RecommendedFoodResponse: Decodable {
    let status: Bool?
    let message: String?
    let foods: [RecommendedFood]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case foods = "recommended_foods"
    }
}

