//
//  LocalDBManager.swift
//  HamHumApp
//
//  Created by ALEMDAR on 22.08.2021.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init(){
        
    }
    
    func fetchCartItems() -> [NSManagedObject] {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CartItem")
        
        do {
            let objects = try context.fetch(fetchRequest)

            return objects as? [NSManagedObject] ?? []
            
        }catch {
            print(error.localizedDescription)
        }
        
        return []
    }
    
    func insertToCart(id: Int, count: Int, addons: [Int]){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let newItem = NSEntityDescription.insertNewObject(forEntityName: "CartItem", into: context)
        newItem.setValue(id, forKey: "food_id")
        newItem.setValue(count, forKey: "count")
//        newItem.setValue(addons, forKey: "addons")
        
        do{
            try context.save()
        }catch {
            print(error.localizedDescription)
        }
        
    }
    
}
