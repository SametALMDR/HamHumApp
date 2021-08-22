//
//  SearchFoodResponse.swift
//  HamHumApp
//
//  Created by ALEMDAR on 22.08.2021.
//

import Foundation

struct SearchFoodResponse: Decodable {
    let status: Bool?
    let message: String?
    let foods: [SearchFood]?
}
