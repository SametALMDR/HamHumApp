//
//  LoginViewModel.swift
//  HamHumApp
//
//  Created by ALEMDAR on 11.08.2021.
//

import Foundation

enum AlertType {
    case error
    case success
}

protocol LoginViewModelProtocol {

}

protocol LoginViewModelDelegate: AnyObject {
    func showAlert(type: AlertType)
}

class LoginViewModel: BaseViewModel {
    
    var email: String = ""
    var password: String = ""
    var errorMessage: String = ""
    var successMessage: String = ""
    
    weak var delegate: LoginViewModelDelegate?
    
    func login(){
        API().login(email: email, password: password) { [weak self] (result) in
            switch result {
            case .success(let loginResponse):
        
                if loginResponse.status ?? false {
                    
                    UserDefaults.standard.setValue(loginResponse.user?.token, forKey: "token")
                    UserDefaults.standard.setValue(loginResponse.user?.id, forKey: "userID")
                    
                    self?.successMessage = loginResponse.message ?? ""
                    self?.delegate?.showAlert(type: .success)
                    
                }else {
                    self?.errorMessage = loginResponse.message ?? ""
                    self?.delegate?.showAlert(type: .error)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
