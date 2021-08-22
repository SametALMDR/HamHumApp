//
//  LoginViewController.swift
//  HamHumApp
//
//  Created by ALEMDAR on 11.08.2021.
//

import SnapKit
import NotificationBannerSwift

class RegisterViewController: BaseViewController<RegisterViewModel> {
    
    private let viewContext: UIView = {
        let view = UIView()
        return view
    }()
    
    private let stackViewTextFields: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillEqually
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
    
    private let textFieldName: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Color.neutrals.greyTwo.cgColor
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.font = UIFont(name: Font.CenturyGothic.regular, size: 12)
        return textField
    }()
    
    private let textFieldSurname: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Surname"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Color.neutrals.greyTwo.cgColor
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.font = UIFont(name: Font.CenturyGothic.regular, size: 12)
        return textField
    }()
    
    private let textFieldUsername: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Color.neutrals.greyTwo.cgColor
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.font = UIFont(name: Font.CenturyGothic.regular, size: 12)
        return textField
    }()
    
    private let textFieldEmail: UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-mail Address"
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
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let buttonRegister: UIButton = {
        let button = UIButton()
        button.setTitle("Register Now", for: .normal)
        button.layer.cornerRadius = 17
        button.backgroundColor = Color.primary.red
        button.titleLabel?.font = UIFont(name: Font.CenturyGothic.regular, size: 12)
        return button
    }()
    
    private let labelLogin: UILabel = {
        let label = UILabel()
        label.text = "Already have an account? Log in"
        label.font = UIFont(name: Font.CenturyGothic.bold, size: 16)
        label.textColor = Color.neutrals.greySix
        label.isUserInteractionEnabled = true
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
        
        configure()
    }
    
    private func configure(){
        
        viewModel.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToLogin))
        labelLogin.addGestureRecognizer(tapGesture)
        
        buttonRegister.addTarget(self, action: #selector(register), for: .touchUpInside)
    }
    
    @objc func register(){
        
        if textFieldName.text?.isEmpty ?? true || textFieldSurname.text?.isEmpty ?? true || textFieldUsername.text?.isEmpty ?? true ||
            textFieldEmail.text?.isEmpty ?? true || textFieldPassword.text?.isEmpty ?? true {
            let banner = NotificationBanner(title: "Error", subtitle: "Please, fill in all fields", style: .danger)
            banner.show()
            return
        }
        
        viewModel.name = textFieldName.text ?? ""
        viewModel.surname = textFieldSurname.text ?? ""
        viewModel.username = textFieldUsername.text ?? ""
        viewModel.email = textFieldEmail.text ?? ""
        viewModel.password = textFieldPassword.text ?? ""
        
        viewModel.register()
    }
    
    @objc func goToLogin(){
        dismiss(animated: true, completion: nil)
    }
    
    override func setupUI() {
        view.backgroundColor = Color.secondary.background
    }
    
    private func clearFields(){
        textFieldName.text = ""
        textFieldSurname.text = ""
        textFieldUsername.text = ""
        textFieldEmail.text = ""
        textFieldPassword.text = ""
    }
    
    override func layout(){
        
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(imageViewBackground)
        imageViewBackground.snp.makeConstraints { (make) in
            make.top.equalTo(safeArea)
            make.leading.equalTo(safeArea)
            make.trailing.equalTo(safeArea)
            make.height.equalTo(359)
        }
        
        view.addSubview(imageViewLogo)
        imageViewLogo.snp.makeConstraints { (make) in
            make.bottom.equalTo(imageViewBackground).offset(-79)
            make.height.equalTo(90)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(stackViewTextFields)
        stackViewTextFields.addArrangedSubview(textFieldName)
        stackViewTextFields.addArrangedSubview(textFieldSurname)
        stackViewTextFields.addArrangedSubview(textFieldUsername)
        stackViewTextFields.addArrangedSubview(textFieldEmail)
        stackViewTextFields.addArrangedSubview(textFieldPassword)
        
        stackViewTextFields.snp.makeConstraints { (make) in
            make.top.equalTo(imageViewLogo.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(buttonRegister)
        buttonRegister.snp.makeConstraints { (make) in
            make.top.equalTo(stackViewTextFields.snp.bottom).offset(19)
            make.centerX.equalTo(safeArea)
            make.width.equalTo(106)
            make.height.equalTo(34)
        }
        
        view.addSubview(labelLogin)
        labelLogin.snp.makeConstraints { (make) in
            make.bottom.equalTo(safeArea).offset(-52)
            make.centerX.equalTo(safeArea)
        }
        
        textFieldEmail.snp.makeConstraints { (make) in
            make.width.equalTo(244)
            make.height.equalTo(32)
        }
        
        textFieldPassword.snp.makeConstraints { (make) in
            make.width.equalTo(244)
            make.height.equalTo(32)
        }
        
    }
}


extension RegisterViewController: RegisterViewModelDelegate {
    
    func showAlert(type: AlertType) {
        
        if type == .success {
            let banner = NotificationBanner(title: "Success", subtitle: viewModel.successMessage, style: .success)
            banner.show()
            
            clearFields()
            
            let VC = MainTabBarController()
            VC.modalPresentationStyle = .currentContext
            self.present(VC, animated: true, completion: nil)
        }else {
            let banner = NotificationBanner(title: "Error", subtitle: viewModel.errorMessage, style: .danger)
            banner.show()
        }
        
    }
    
    
}
