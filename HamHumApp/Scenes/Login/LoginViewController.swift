//
//  LoginViewController.swift
//  HamHumApp
//
//  Created by ALEMDAR on 11.08.2021.
//

import SnapKit

class LoginViewController: UIViewController {
    
    private let viewContext: UIView = {
        let view = UIView()
        return view
    }()
    
    private let stackViewTextFields: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    private let textFieldFirstName: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private let textFieldLastName: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private let textFieldEmailorUsername: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Usename or email"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Color.neutrals.greyTwo.cgColor
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.font = UIFont(name: Font.CenturyGothic.regular, size: 12)
        return textField
    }()
    
    private let textFieldPassword: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Color.neutrals.greyTwo.cgColor
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.font = UIFont(name: Font.CenturyGothic.regular, size: 12)
        return textField
    }()
    
    private let buttonLogin: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 17
        button.backgroundColor = Color.primary.red
        button.titleLabel?.font = UIFont(name: Font.CenturyGothic.regular, size: 12)
        return button
    }()
    
    private let labelForgotPassword: UILabel = {
        let label = UILabel()
        label.text = "Forgot your password?"
        label.textColor = Color.neutrals.greyFive
        label.font = UIFont(name: Font.CenturyGothic.regular, size: 12)
        return label
    }()
    
    private let labelNewAccount: UILabel = {
        let label = UILabel()
        label.text = "Create new account"
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 16)
        label.textColor = Color.neutrals.greySix
        return label
    }()
    
    private let imageViewBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "login_bg")
        return imageView
    }()
    
    private let imageViewLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.secondary.background
        
        setupLayouts()
    }
    
    private func setupLayouts(){
        
        let safeArea = view.safeAreaLayoutGuide
        
        stackViewTextFields.addArrangedSubview(textFieldEmailorUsername)
        stackViewTextFields.addArrangedSubview(textFieldPassword)
          
        view.addSubview(imageViewBackground)
        view.addSubview(imageViewLogo)
        view.addSubview(stackViewTextFields)
        view.addSubview(buttonLogin)
        view.addSubview(labelForgotPassword)
        view.addSubview(labelNewAccount)
        
        imageViewBackground.snp.makeConstraints { (make) in
            make.top.equalTo(safeArea)
            make.leading.equalTo(safeArea)
            make.trailing.equalTo(safeArea)
            make.height.equalTo(359)
        }
        
        imageViewLogo.snp.makeConstraints { (make) in
            make.bottom.equalTo(imageViewBackground).offset(-79)
            make.height.equalTo(90)
            make.centerX.equalTo(safeArea)
        }
        
        stackViewTextFields.snp.makeConstraints { (make) in
            make.center.equalTo(view.center)
        }
        
        textFieldEmailorUsername.snp.makeConstraints { (make) in
            make.width.equalTo(244)
            make.height.equalTo(32)
        }
        
        textFieldPassword.snp.makeConstraints { (make) in
            make.width.equalTo(244)
            make.height.equalTo(32)
        }
        
        buttonLogin.snp.makeConstraints { (make) in
            make.top.equalTo(stackViewTextFields.snp.bottom).offset(19)
            make.centerX.equalTo(safeArea)
            make.width.equalTo(106)
            make.height.equalTo(34)
        }
        
        labelForgotPassword.snp.makeConstraints { (make) in
            make.top.equalTo(buttonLogin.snp.bottom).offset(23)
            make.centerX.equalTo(safeArea)
        }
                
        labelNewAccount.snp.makeConstraints { (make) in
            make.bottom.equalTo(safeArea).offset(-52)
            make.centerX.equalTo(safeArea)
        }
        
        
    }
}
