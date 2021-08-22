//
//  CartViewModel.swift
//  HamHumApp
//
//  Created by ALEMDAR on 22.08.2021.
//

import Foundation
import CoreData

protocol CartViewModelProtocol {
    var numberOfItems: Int { get }
    
    func load()
    
    func item(row: Int) -> CartItemModel
}

protocol CartViewModelDelegate: AnyObject {
    func reloadData()
}

class CartViewModel: BaseViewModel {
    
    var cartItems: [CartItemModel] = []
    
    weak var delegate: CartViewModelDelegate?
    
    private func fetchCartItems(){
        
        self.cartItems.removeAll()
        
        let items = CoreDataManager.shared.fetchCartItems()

        for item in items {
            
            if let foodID = item.value(forKey: "food_id") as? Int {
                
                let foodCount = item.value(forKey: "count") as? Int
                
                API().fetchFoodDetail(id: foodID) { [weak self] (result) in
                    switch result {
                    case .success(let foodDetailResponse):

                        if let food = foodDetailResponse.food {
                            
                            let cartItem = CartItemModel(name: food.name,
                                                         image: food.image,
                                                         count: foodCount,
                                                         price: food.price,
                                                         currency: food.currency)
                            self?.cartItems.append(cartItem)
                            self?.delegate?.reloadData()
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
    
}

extension CartViewModel: CartViewModelProtocol {
    
    var numberOfItems: Int {
        cartItems.count
    }
    
    func load() {
        fetchCartItems()
    }
    
    func item(row: Int) -> CartItemModel {
        cartItems[row]
    }
    
}
