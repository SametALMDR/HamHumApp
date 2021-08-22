//
//  SearchViewModel.swift
//  HamHumApp
//
//  Created by ALEMDAR on 22.08.2021.
//

import Foundation

protocol SearchViewModelProtocol {
    var numberOfItems: Int { get }
    
    func food(row: Int) -> SearchFood
}

protocol SearchViewModelDelegate: AnyObject {
    func reloadData()
}

class SearchViewModel: BaseViewModel {
    
    private var foods: [SearchFood] = []
    
    weak var delegate: SearchViewModelDelegate?
    
    func fetchSearchedFood(name: String) {
        
        API().fetchSearch(name: name) { [weak self] (result) in
            switch result {
            case .success(let searchFoodResponse):
                self?.foods = searchFoodResponse.foods ?? []
                self?.delegate?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension SearchViewModel: SearchViewModelProtocol {
    
    var numberOfItems: Int {
        foods.count
    }
    
    func food(row: Int) -> SearchFood {
        foods[row]
    }
    
}
