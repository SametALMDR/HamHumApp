//
//  SearchViewController.swift
//  HamHumApp
//
//  Created by ALEMDAR on 17.08.2021.
//

import UIKit
import SnapKit

class SearchViewController: BaseViewController<SearchViewModel> {
    
    private enum Constants {
        enum NavigationBar {
            static let title: String = "Search Food"
        }
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        layout.estimatedItemSize = .zero
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = Color.secondary.background
        return collectionView
    }()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationTitle(title: Constants.NavigationBar.title)
        setBackgroundColor(color: Color.primary.red)
        configureSearchController()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.delegate = self
    }
    
    private func configureSearchController() {
        searchController.searchBar.searchTextField.backgroundColor = Color.secondary.background
        searchController.searchBar.placeholder = "Ex: Hot Pizza.."
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(cellType: SearchCollectionViewCell.self)
    }
    
    private func setEmtpyView(){
        let emptyView = UIView(frame: collectionView.frame)
        let imageView = UIImageView()
        imageView.image = UIImage(named: "no-results")?.setColor(color: Color.primary.red.withAlphaComponent(0.5))
      
        emptyView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalTo(emptyView)
            make.width.height.equalTo(150)
        }
        
        collectionView.backgroundView = emptyView
    }
    
    private func removeEmptyView(){
        collectionView.backgroundView = nil
    }
    
    override func layout(){
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if viewModel.numberOfItems == 0 {
            setEmtpyView()
        }else{
            removeEmptyView()
        }
        
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeCell(cellType: SearchCollectionViewCell.self, indexPath: indexPath)
        
        let food = viewModel.food(row: indexPath.row)
        cell.configure(with: food)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 , height: 254)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let food = viewModel.food(row: indexPath.row)
        
        if let id = food.id {
            let foodDetailVC = FoodDetailViewController()
            foodDetailVC.viewModel.foodID = id
            navigationController?.pushViewController(foodDetailVC, animated: true)
        }
        
    }
    
}

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
        
        if let searchText = searchBar.text {
            viewModel.fetchSearchedFood(name: searchText)
        }
    }
    
}

extension SearchViewController: SearchViewModelDelegate {
    
    func reloadData() {
        collectionView.reloadData()
    }
    
}
