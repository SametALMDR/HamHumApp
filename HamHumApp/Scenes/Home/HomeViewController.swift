//
//  HomeViewController.swift
//  HamHumApp
//
//  Created by ALEMDAR on 12.08.2021.
//

import SnapKit

class HomeViewController: UIViewController {
    
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
        label.font = UIFont(name: "CenturyGothic-Bold", size: 30)
        label.numberOfLines = 0
        return label
    }()
    
    private let searchTextField: UISearchTextField = {
        let searchTextField = UISearchTextField()
        searchTextField.backgroundColor = .white
        searchTextField.background = UIImage()
        searchTextField.tintColor = Color.primary.red
        searchTextField.tokenBackgroundColor = .blue
        searchTextField.placeholder = "Search"
        searchTextField.font = UIFont(name: "CenturyGothic", size: 14)
        searchTextField.textColor = Color.neutrals.greyThree
        searchTextField.layer.cornerRadius = 10
        return searchTextField
    }()
    
    //here
    private let categoryTitle: CategoryTitleWithImage = {
        let view = CategoryTitleWithImage()
        return view
    }()
    
    private let labelRecommendedTitle: UILabel = {
        let label = UILabel()
        label.text = "Recommended"
        label.textColor = Color.neutrals.greySix
        label.font = UIFont(name: "CenturyGothic-Bold", size: 20)
        return label
    }()
    
    private let labelRecommendedAll: UILabel = {
        let label = UILabel()
        label.text = "View All >"
        label.textColor = Color.primary.red
        label.font = UIFont(name: "CenturyGothic-Bold", size: 13)
        return label
    }()
    
    private let foodBigCard: FoodBigCardView = {
        let view = FoodBigCardView()
        return view
    }()
    
    private let labelPopularItems: UILabel = {
        let label = UILabel()
        label.text = "Popular Items"
        label.textColor = Color.neutrals.greySix
        label.font = UIFont(name: "CenturyGothic-Bold", size: 20)
        return label
    }()
    
    private let labelPopularAll: UILabel = {
        let label = UILabel()
        label.text = "View All >"
        label.textColor = Color.primary.red
        label.font = UIFont(name: "CenturyGothic-Bold", size: 13)
        return label
    }()
    
    private let foodSmallCard: FoodSmallCardView = {
        let view = FoodSmallCardView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.secondary.background
        layout()
        foodBigCard.configure(with: FoodBigCardViewUIModel(
                                foodRateUIModel: FoodRateViewUIModel(rate: 4.5, rateCount: 25),
                                isFavorite: true,
                                image: "crepesandwaffels",
                                title: "Crepes and Waffles",
                                isAvailable: true,
                                deliveryPrice: "Free delivery",
                                deliveryTime: "10 - 15 mins",
                                categories: ["aas","ass"])
        )
        foodSmallCard.configure(with: FoodSmallCardViewUIModel(image: "popular", title: "Waffles", subtitle: "Lorem ipsum dolor", price: "$3.99"))
        
    }
    
    func layout(){

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

        scrollViewContent.addSubview(searchTextField)
        searchTextField.snp.makeConstraints { (make) in
            make.top.equalTo(labelSearchTitle.snp.bottom).offset(30)
            make.leading.trailing.equalTo(scrollViewContent)
            make.height.equalTo(60)
        }
        
        scrollViewContent.addSubview(categoryTitle)
        categoryTitle.snp.makeConstraints { (make) in
            make.top.equalTo(searchTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview()
        }

        scrollViewContent.addSubview(labelRecommendedTitle)
        labelRecommendedTitle.snp.makeConstraints { (make) in
            make.top.equalTo(categoryTitle.snp.bottom).offset(30)
            make.leading.equalTo(scrollViewContent)
        }

        scrollViewContent.addSubview(labelRecommendedAll)
        labelRecommendedAll.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelRecommendedTitle)
            make.trailing.equalToSuperview()
        }
        
        scrollViewContent.addSubview(foodBigCard)
        foodBigCard.snp.makeConstraints { (make) in
            make.top.equalTo(labelRecommendedTitle.snp.bottom).offset(20)
            make.leading.equalTo(scrollViewContent)
        }
        
        
        scrollViewContent.addSubview(labelPopularItems)
        labelPopularItems.snp.makeConstraints { (make) in
            make.top.equalTo(foodBigCard.snp.bottom).offset(30)
            make.leading.trailing.equalTo(scrollViewContent)
        }
        
        scrollViewContent.addSubview(labelPopularAll)
        labelPopularAll.snp.makeConstraints { (make) in
            make.centerY.equalTo(labelPopularItems)
            make.trailing.equalToSuperview()
        }
        
        scrollViewContent.addSubview(foodSmallCard)
        foodSmallCard.snp.makeConstraints { (make) in
            make.top.equalTo(labelPopularItems.snp.bottom).offset(20)
            make.leading.equalTo(scrollViewContent)
            make.bottom.equalTo(scrollViewContent).offset(-50)
        }
        
    }
}
