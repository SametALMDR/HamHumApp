//
//  BaseViewController.swift
//  TodoApp
//
//  Created by ALEMDAR on 10.08.2021.
//

import UIKit

class BaseViewController<ViewModel: BaseViewModel>: UIViewController {

    var viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        layout()
    }
    
    func setupUI() {
        
    }
    
    func layout(){
        
    }
    
    func setNavigationTitle(title: String) {
        navigationItem.title = title
    }
    
    func setBackgroundColor(color: UIColor) {
        view.backgroundColor = color
    }
    
    func showNavigationBar(){
        navigationController?.navigationBar.isHidden = false
    }
    
    func hideNavigationBar(){
        navigationController?.navigationBar.isHidden = true
    }
}
