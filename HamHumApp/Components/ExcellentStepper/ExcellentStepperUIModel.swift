//
//  StandartStepperUIModel.swift
//  HamHumApp
//
//  Created by ALEMDAR on 16.08.2021.
//

import UIKit

struct ExcellentStepperUIModel {
    var value: Double // default is 0. sends UIControlEventValueChanged. clamped to min/max
    var minimumValue: Double // default 0. must be less than maximumValue
    var maximumValue: Double // default 100. must be greater than minimumValue
    var stepValue: Double // default 1. must be greater than 0
}
