//
//  RecommendedFood.swift
//  HamHumApp
//
//  Created by ALEMDAR on 21.08.2021.
//

import Foundation

struct RecommendedFood: Decodable{
    let id: Int?
    let name: String?
    let description: String?
    let image: String?
    let categories: [Category]?
    let price: Double?
    let isPopular: Bool?
    let isRecommended: Bool?
    let rate: Double?
    let rateCount: Int
    let isAvailable: Bool?
    let popularSubTitle: String?
    let preparationTime: String?
    let deliveryPrice: String?
    let currency: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case image
        case categories
        case price
        case isPopular = "is_popular"
        case isRecommended = "is_recommended"
        case rate
        case rateCount = "rate_count"
        case isAvailable = "is_available"
        case popularSubTitle = "popular_subtitle"
        case preparationTime = "preparation_time"
        case deliveryPrice = "delivery_price"
        case currency
    }
}
