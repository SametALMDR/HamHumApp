//
//  FoodBigCardViewUIModel.swift
//  HamHumApp
//
//  Created by ALEMDAR on 15.08.2021.
//

import Foundation

struct FoodBigCardViewUIModel {
    var foodRateUIModel: FoodRateViewUIModel
    var isFavorite: Bool
    var image: String?
    var title: String
    var isAvailable: Bool
    var deliveryPrice: String
    var deliveryTime: String
    var categories: [String]
}
