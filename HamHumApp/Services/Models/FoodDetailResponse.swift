//
//  FoodDetailResponse.swift
//  HamHumApp
//
//  Created by ALEMDAR on 22.08.2021.
//

import Foundation

struct FoodDetailResponse: Decodable {
    let status: Bool?
    let message: String?
    let food: FoodDetail?
}
