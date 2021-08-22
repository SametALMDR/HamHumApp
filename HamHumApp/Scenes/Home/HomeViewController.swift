//
//  HomeViewController.swift
//  HamHumApp
//
//  Created by ALEMDAR on 12.08.2021.
//

import SnapKit

class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let scrollViewContent: UIView = {
        let view = UIView()
        return view
    }()
    
    private let viewMenuIcon: MenuIconView = {
        let view = MenuIconView()
        return view
    }()
    
    private let viewDeliveryAddress: DeliveryAddressView = {
        let view = DeliveryAddressView()
        return view
    }()
    
    private let imageViewUserProfile: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = Color.primary.red
        imageView.image = UIImage(named: "default-user")?.setColor(color: .white)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.shadowOffset = CGSize(width: 0, height: 2)
        imageView.layer.shadowColor = UIColor.darkText.cgColor.copy(alpha: 0.5)
        imageView.layer.shadowOpacity = 0.2
        imageView.layer.shadowRadius = 4
        return imageView
    }()
    
    private let labelSearchTitle: UILabel = {
        let label = UILabel()
        label.text = "What would you like to order today?"
        label.textColor = Color.neutrals.greySix
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 30)
        label.numberOfLines = 0
        return label
    }()
    
    private let collectionViewCategories: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        flowLayout.itemSize = CGSize(width: 68, height: 108)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .none
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let labelRecommendedTitle: UILabel = {
        let label = UILabel()
        label.text = "Recommended"
        label.textColor = Color.neutrals.greySix
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 20)
        return label
    }()
    
    private let labelRecommendedAll: UILabel = {
        let label = UILabel()
        label.text = "View All >"
        label.textColor = Color.primary.red
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 13)
        return label
    }()
    
    private let collectionViewRecommendedFoods: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        flowLayout.itemSize = CGSize(width: 255, height: 255)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .none
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let labelPopularItems: UILabel = {
        let label = UILabel()
        label.text = "Popular Items"
        label.textColor = Color.neutrals.greySix
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 20)
        return label
    }()

    private let labelPopularAll: UILabel = {
        let label = UILabel()
        label.text = "View All >"
        label.textColor = Color.primary.red
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 13)
        return label
    }()

    private let collectionViewPopularFoods: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        flowLayout.itemSize = CGSize(width: 140, height: 80)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .none
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private var selectedCategoryIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hideNavigationBar()
        viewModel.delegate = self
        viewModel.load()
    }
    
    override func setupUI(){
        view.backgroundColor = Color.secondary.background
    }
    
    private func configureCollectionView(){
        collectionViewCategories.delegate = self
        collectionViewCategories.dataSource = self
        collectionViewCategories.register(cellType: HomeCategoryCollectionViewCell.self)
        
        collectionViewRecommendedFoods.delegate = self
        collectionViewRecommendedFoods.dataSource = self
        collectionViewRecommendedFoods.register(cellType: HomeRecommendedCollectionViewCell.self)
        
        collectionViewPopularFoods.delegate = self
        collectionViewPopularFoods.dataSource = self
        collectionViewPopularFoods.register(cellType: HomePopularCollectionViewCell.self)
    }
    
    override func layout(){

        let safeArea = self.view.safeAreaLayoutGuide
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalTo(safeArea)
        }
        
        scrollView.addSubview(scrollViewContent)
        scrollViewContent.snp.makeConstraints { (make) in
            make.top.leading.equalTo(scrollView).offset(25)
            make.bottom.equalTo(scrollView)
            make.trailing.equalTo(scrollView)
            make.height.equalTo(view).priority(250)
            make.width.equalTo(view).offset(-50)
        }
        
        scrollViewContent.addSubview(viewMenuIcon)
        viewMenuIcon.snp.makeConstraints { (make) in
            make.top.leading.equalTo(scrollViewContent)
            make.width.equalTo(45)
            make.height.equalTo(45)
        }
        
        scrollViewContent.addSubview(imageViewUserProfile)
        imageViewUserProfile.snp.makeConstraints { (make) in
            make.top.trailing.equalTo(scrollViewContent)
            make.trailing.equalTo(scrollViewContent)
            make.width.height.equalTo(45)
        }
        
        scrollViewContent.addSubview(viewDeliveryAddress)
        viewDeliveryAddress.snp.makeConstraints { (make) in
            make.centerY.equalTo(viewMenuIcon)
            make.leading.equalTo(viewMenuIcon.snp.trailing).offset(10)
            make.trailing.equalTo(imageViewUserProfile.snp.leading).offset(-10)
        }
        
        scrollViewContent.addSubview(labelSearchTitle)
        labelSearchTitle.snp.makeConstraints { (make) in
            make.top.equalTo(viewDeliveryAddress.snp.bottom).offset(30)
            make.leading.trailing.equalTo(scrollViewContent)
        }
        
        scrollViewContent.addSubview(collectionViewCategories)
        collectionViewCategories.snp.makeConstraints { (make) in
            make.top.equalTo(labelSearchTitle.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(130)
        }

        scrollViewContent.addSubview(labelRecommendedTitle)
        labelRecommendedTitle.snp.makeConstraints { (make) in
            make.top.equalTo(collectionViewCategories.snp.bottom).offset(30)
            make.leading.equalTo(scrollViewContent)
        }

        scrollViewContent.addSubview(labelRecommendedAll)
        labelRecommendedAll.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelRecommendedTitle)
            make.trailing.equalToSuperview()
        }
        
        scrollViewContent.addSubview(collectionViewRecommendedFoods)
        collectionViewRecommendedFoods.snp.makeConstraints { (make) in
            make.top.equalTo(labelRecommendedTitle.snp.bottom).offset(20)
            make.leading.trailing.equalTo(scrollViewContent)
            make.height.equalTo(260)
        }
        
        
        scrollViewContent.addSubview(labelPopularItems)
        labelPopularItems.snp.makeConstraints { (make) in
            make.top.equalTo(collectionViewRecommendedFoods.snp.bottom).offset(30)
            make.leading.trailing.equalTo(scrollViewContent)
        }

        scrollViewContent.addSubview(labelPopularAll)
        labelPopularAll.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelPopularItems)
            make.trailing.equalToSuperview()
        }

        scrollViewContent.addSubview(collectionViewPopularFoods)
        collectionViewPopularFoods.snp.makeConstraints { (make) in
            make.top.equalTo(labelPopularItems.snp.bottom).offset(20)
            make.leading.trailing.equalTo(scrollViewContent)
            make.height.equalTo(100)
            make.bottom.equalTo(scrollViewContent).offset(-50)
        }
        
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionViewCategories {
            return viewModel.numberOfCategoryItems
        }
        
        if collectionView == collectionViewRecommendedFoods {
            return viewModel.numberOfRecommendedItems
        }

        return viewModel.numberOfPopularItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        // Configuration of Category Cells
        if collectionView == collectionViewCategories {
            let cell = collectionView.dequeCell(cellType: HomeCategoryCollectionViewCell.self, indexPath: indexPath)
            
            let category = viewModel.category(row: indexPath.row)
            cell.configure(with: category)
            
            // Control of selected category item
            if selectedCategoryIndex == indexPath.row {
                cell.selected()
            }else{
                cell.notSelected()
            }
            
            return cell
        }
        
        // Configuration of Recommended Food Cells
        if collectionView == collectionViewRecommendedFoods {
            
            let cell = collectionView.dequeCell(cellType: HomeRecommendedCollectionViewCell.self, indexPath: indexPath)
            
            let recommendedFood = viewModel.recommendedFood(row: indexPath.row)
            cell.configure(with: recommendedFood)
            
            return cell
        }
        
        // Configuration of Popular Food Cells
        let cell = collectionView.dequeCell(cellType: HomePopularCollectionViewCell.self, indexPath: indexPath)
        
        let popularFood = viewModel.popularFood(row: indexPath.row)
        cell.configure(with: popularFood)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == collectionViewCategories {
            selectedCategoryIndex = indexPath.row
            collectionView.reloadData()
        }
        
        if collectionView == collectionViewRecommendedFoods {
            
            let recommendedFood = viewModel.recommendedFood(row: indexPath.row)
            
            if let id = recommendedFood.id {
                let foodDetailVC = FoodDetailViewController()
                foodDetailVC.viewModel.foodID = id
                navigationController?.pushViewController(foodDetailVC, animated: true)
            }
        }
        
        if collectionView == collectionViewPopularFoods {
            
            let popularFood = viewModel.popularFood(row: indexPath.row)
            
            if let id = popularFood.id {
                let foodDetailVC = FoodDetailViewController()
                foodDetailVC.viewModel.foodID = id
                navigationController?.pushViewController(foodDetailVC, animated: true)
            }
        }
        
    }
}

extension HomeViewController: HomeViewModelDelegate {
    
    func reloadDataCategories() {
        collectionViewCategories.reloadData()
    }
    
    func reloadDataRecommendedFoods() {
        collectionViewRecommendedFoods.reloadData()
    }
    
    func reloadDataPopularFoods() {
        collectionViewPopularFoods.reloadData()
    }

}
