//
//  CartViewController.swift
//  HamHumApp
//
//  Created by ALEMDAR on 14.08.2021.
//

import UIKit

class CartViewController: UIViewController {
    
    private let viewCartSummary: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let labelTotal: UILabel = {
        let label = UILabel()
        label.text = "Total"
        label.textColor = Color.primary.red
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 20)
        return label
    }()
    
    private let labelTotalPrice: UILabel = {
        let label = UILabel()
        label.text = "$59.49"
        label.textColor = Color.primary.black
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 20)
        return label
    }()
    
    private let buttonCheckout: StandardButton = {
        let button = StandardButton()
        button.configure(with: StandardButtonUIModel(title: "Checkout"))
        button.backgroundColor = Color.primary.black
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        return tableView
    }()
    
    var cartItems: [String] = ["1","2","3","4","5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        layout()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
    }
    
    private func setupUI(){
        view.backgroundColor = Color.secondary.background
        tableView.backgroundColor = Color.secondary.background
        tableView.separatorStyle = .none
        viewCartSummary.layer.shadowOffset = CGSize(width: 0, height: 0)
        viewCartSummary.layer.shadowColor = UIColor.darkText.cgColor.copy(alpha: 0.5)
        viewCartSummary.layer.shadowOpacity = 0.2
        viewCartSummary.layer.shadowRadius = 4
    }
    
    private func layout(){
        
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(viewCartSummary)
        viewCartSummary.snp.makeConstraints { (make) in
            make.leading.bottom.trailing.equalTo(safeArea)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(safeArea)
            make.bottom.equalTo(viewCartSummary.snp.top).offset(-15)
        }
        
        viewCartSummary.addSubview(labelTotal)
        labelTotal.snp.makeConstraints { (make) in
            make.top.equalTo(viewCartSummary).offset(15)
            make.leading.equalTo(viewCartSummary).offset(15)
            make.bottom.equalTo(viewCartSummary).offset(-135)
        }
        
        viewCartSummary.addSubview(labelTotalPrice)
        labelTotalPrice.snp.makeConstraints { (make) in
            make.top.equalTo(viewCartSummary).offset(15)
            make.trailing.equalTo(viewCartSummary).offset(-15)
        }
        
        viewCartSummary.addSubview(buttonCheckout)
        buttonCheckout.snp.makeConstraints { (make) in
            make.top.equalTo(labelTotal.snp.bottom).offset(10)
            make.leading.equalTo(viewCartSummary).offset(15)
            make.trailing.equalTo(viewCartSummary).offset(-15)
        }
        
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as? CartTableViewCell else {
            return UITableViewCell()
        }
        
        cell.editingAccessoryView = UIView()
        cell.configure(image: "cart-image", name: "Pizza", count: 3, singlePrice: 50)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) {  (contextualAction, view, boolValue) in
            self.cartItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = Color.secondary.background
        deleteAction.image = UIImage(named: "trash-icon")
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeActions
    }

}
