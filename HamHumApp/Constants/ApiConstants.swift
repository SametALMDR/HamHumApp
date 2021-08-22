//
//  ApiConstants.swift
//  HamHumApp
//
//  Created by ALEMDAR on 20.08.2021.
//

import Foundation

struct ApiConstants {
    static let ApiEnv = ApiEnvironment.Prod
}

private enum ApiEnvironment {
    static let Dev = "https://darf.xyz"
    static let Prod = "https://darf.xyz"
}
