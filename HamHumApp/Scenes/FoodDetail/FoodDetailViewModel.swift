//
//  FoodDetailViewModel.swift
//  HamHumApp
//
//  Created by ALEMDAR on 22.08.2021.
//

import Foundation


protocol FoodDetailViewModelProtocol {
    
    func load()
}

protocol FoodDetailViewModelDelegate: AnyObject {
    func loadData()
}

class FoodDetailViewModel: BaseViewModel {
    
    var foodID: Int?
    var food: FoodDetail?
    
    weak var delegate: FoodDetailViewModelDelegate?
    
    private func fetchFoodDetail() {
        
        guard let foodID = foodID else { return }
        
        API().fetchFoodDetail(id: foodID) { [weak self] (result) in
            switch result {
            case .success(let foodDetailResponse):
                self?.food = foodDetailResponse.food
                self?.delegate?.loadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension FoodDetailViewModel: FoodDetailViewModelProtocol {
    
    func load() {
        fetchFoodDetail()
    }
    
}
