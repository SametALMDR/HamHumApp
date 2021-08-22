//
//  OrderViewModel.swift
//  HamHumApp
//
//  Created by ALEMDAR on 22.08.2021.
//

import Foundation

protocol OrderViewModelProtocol {
    
}

protocol OrderViewModelDelegate: AnyObject {
    
}

class OrderViewModel: BaseViewModel {
    
    weak var delegate: OrderViewModelDelegate?
    
}

extension OrderViewModel: OrderViewModelProtocol {
    
}
