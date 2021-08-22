//
//  HomeViewModel.swift
//  HamHumApp
//
//  Created by ALEMDAR on 21.08.2021.
//

import Foundation

protocol HomeViewModelProtocol {
    var numberOfCategoryItems: Int { get }
    var numberOfRecommendedItems: Int { get }
    var numberOfPopularItems: Int { get }
    
    func load()
    
    func category(row: Int) -> Category
    func recommendedFood(row: Int) -> RecommendedFood
    func popularFood(row: Int) -> PopularFood
}

protocol HomeViewModelDelegate: AnyObject {
    func reloadDataCategories()
    func reloadDataRecommendedFoods()
    func reloadDataPopularFoods()
}

class HomeViewModel: BaseViewModel {
    
    private var categories: [Category] = []
    private var recommendedFoods: [RecommendedFood] = []
    private var popularFoods: [PopularFood] = []
    
    weak var delegate: HomeViewModelDelegate?
    
    private func fetchCategories() {
        API().fetchCategories { [weak self] (result) in
            switch result {
            case .success(let categoriesResponse):
                self?.categories = categoriesResponse.categories ?? []
                self?.delegate?.reloadDataCategories()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchRecommendedFoods(){
        API().fetchRecommendedFoods { [weak self] (result) in
            switch result {
            case .success(let recommendedFoodResponse):
                self?.recommendedFoods = recommendedFoodResponse.foods ?? []
                self?.delegate?.reloadDataRecommendedFoods()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchPopularFoods(){
        API().fetchPopularFoods { [weak self] (result) in
            switch result {
            case .success(let popularFoodResponse):
                self?.popularFoods = popularFoodResponse.foods ?? []
                self?.delegate?.reloadDataPopularFoods()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension HomeViewModel: HomeViewModelProtocol {

    var numberOfCategoryItems: Int {
        categories.count
    }
    
    var numberOfRecommendedItems: Int {
        recommendedFoods.count
    }
    
    var numberOfPopularItems: Int {
        popularFoods.count
    }

    func load() {
        fetchCategories()
        fetchRecommendedFoods()
        fetchPopularFoods()
    }
    
    func category(row: Int) -> Category {
        categories[row]
    }
    
    func recommendedFood(row: Int) -> RecommendedFood {
        recommendedFoods[row]
    }
    
    func popularFood(row: Int) -> PopularFood {
        popularFoods[row]
    }
    
}
