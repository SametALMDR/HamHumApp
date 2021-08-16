//
//  BaseViewController.swift
//  TodoApp
//
//  Created by ALEMDAR on 10.08.2021.
//

import UIKit

class BaseViewController<ViewModel: BaseViewModel>: UIViewController {

//    var coordinator: CoordinatorProtocol?
    
    var viewModel: ViewModel = ViewModel()
    
    var viewModelData: ViewModelData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
