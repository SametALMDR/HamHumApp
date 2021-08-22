//
//  UICollectionView+Ext.swift
//  HamHumApp
//
//  Created by ALEMDAR on 21.08.2021.
//

import UIKit
 
extension UICollectionView {
    
    func register(cellType: UICollectionViewCell.Type) {
        register(cellType.self, forCellWithReuseIdentifier: cellType.identifier)
    }
    
    func dequeCell<T: UICollectionViewCell>(cellType: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath) as? T else {
            fatalError("Reusable cell could not casted.")
        }
            
        return cell
    }
    
}
