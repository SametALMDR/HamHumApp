//
//  FavoritesViewModel.swift
//  HamHumApp
//
//  Created by ALEMDAR on 22.08.2021.
//

import Foundation

protocol FavoritesViewModelProtocol {
    
}

protocol FavoritesViewModelDelegate: AnyObject {
    
}

class FavoritesViewModel: BaseViewModel {
    
    weak var delegate: FavoritesViewModelDelegate?
    
}

extension FavoritesViewModel: FavoritesViewModelProtocol {
    
}
