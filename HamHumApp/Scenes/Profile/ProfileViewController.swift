//
//  ProfileViewController.swift
//  HamHumApp
//
//  Created by ALEMDAR on 17.08.2021.
//

import UIKit
import Kingfisher

class ProfileViewController: BaseViewController<ProfileViewModel> {
    
    private enum Constants {
        enum NavigationBar {
            static let title: String = "Profile"
        }
    }
    
    private let viewUserInformation: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 50
        view.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowColor = UIColor.darkText.cgColor.copy(alpha: 0.5)
        view.layer.shadowOpacity = 0.4
        view.layer.shadowRadius = 5
        return view
    }()
    
    private let imageViewUserProfile: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = Color.primary.red
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let labelFullName: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = Color.neutrals.greySix
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 20)
        return label
    }()
    
    private let labelEmail: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = Color.neutrals.greyThree
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 16)
        return label
    }()
    
    private let stackViewListItems: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        return stackView
    }()
    
    private let listItemViewSettings: ListItemView = {
        let listItemView = ListItemView()
        return listItemView
    }()
    
    private let listItemViewOrders: ListItemView = {
        let listItemView = ListItemView()
        return listItemView
    }()
    
    private let listItemViewDeliveryAddresses: ListItemView = {
        let listItemView = ListItemView()
        return listItemView
    }()
    
    private let listItemViewLogout: ListItemView = {
        let listItemView = ListItemView()
        listItemView.isUserInteractionEnabled = true
        return listItemView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        layout()
        configureComponents()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.load()
    }
    
    private func configure(){
        
        viewModel.delegate = self
        
        let tapGestureLogout = UITapGestureRecognizer(target: self, action: #selector(logout))
        listItemViewLogout.addGestureRecognizer(tapGestureLogout)
    }
    
    @objc func logout() {
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.removeObject(forKey: "userID")
        dismiss(animated: true, completion: nil)
    }
    
    private func configureComponents(){
        listItemViewSettings.configure(with: ListItemViewUIModel(leftIcon: "list-icon-settings", name: "Settings", rightIcon: "list-icon-arrow"))
        listItemViewOrders.configure(with: ListItemViewUIModel(leftIcon: "list-icon-favorites", name: "Favorites", rightIcon: "list-icon-arrow"))
        listItemViewDeliveryAddresses.configure(with: ListItemViewUIModel(leftIcon: "list-icon-addresses", name: "Delivery Address", rightIcon: "list-icon-arrow"))
        listItemViewLogout.configure(with: ListItemViewUIModel(leftIcon: "list-icon-logout", name: "Logout", rightIcon: "list-icon-arrow"))
    }
    
    override func setupUI(){
        setNavigationTitle(title: Constants.NavigationBar.title)
        setBackgroundColor(color: Color.secondary.background)
    }
    
    override func layout(){
        
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(viewUserInformation)
        viewUserInformation.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(safeArea)
        }
        
        
        viewUserInformation.addSubview(imageViewUserProfile)
        imageViewUserProfile.snp.makeConstraints { (make) in
            make.centerX.equalTo(viewUserInformation)
            make.top.equalTo(viewUserInformation).offset(10)
            make.width.height.equalTo(100)
        }
        
        viewUserInformation.addSubview(labelFullName)
        labelFullName.snp.makeConstraints { (make) in
            make.top.equalTo(imageViewUserProfile.snp.bottom).offset(20)
            make.leading.equalTo(viewUserInformation).offset(50)
            make.trailing.equalTo(viewUserInformation).offset(-50)
        }
        
        viewUserInformation.addSubview(labelEmail)
        labelEmail.snp.makeConstraints { (make) in
            make.top.equalTo(labelFullName.snp.bottom)
            make.leading.equalTo(viewUserInformation).offset(50)
            make.trailing.equalTo(viewUserInformation).offset(-50)
            make.bottom.equalTo(viewUserInformation).offset(-20)
        }
        
        view.addSubview(stackViewListItems)
        stackViewListItems.snp.makeConstraints { (make) in
            make.top.equalTo(viewUserInformation.snp.bottom).offset(30)
            make.leading.equalTo(safeArea).offset(30)
            make.trailing.equalTo(safeArea).offset(-30)
        }
        
        stackViewListItems.addArrangedSubview(listItemViewSettings)
        stackViewListItems.addArrangedSubview(listItemViewOrders)
        stackViewListItems.addArrangedSubview(listItemViewDeliveryAddresses)
        stackViewListItems.addArrangedSubview(listItemViewLogout)
    }
    
}

extension ProfileViewController: ProfileViewModelDelegate {
    
    func dataLoaded() {
        if let user = viewModel.user {
            imageViewUserProfile.kf.setImage(with: URL(string: user.image ?? ""))
            labelFullName.text = "\(user.name ?? "") \(user.surname ?? "")"
            labelEmail.text = "\(user.email ?? "")"
        }
    }
    
}
