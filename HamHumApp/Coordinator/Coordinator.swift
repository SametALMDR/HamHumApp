//
//  Coordinator.swift
//  HamHumApp
//
//  Created by ALEMDAR on 12.08.2021.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
