//
//  RegisterViewModel.swift
//  HamHumApp
//
//  Created by ALEMDAR on 11.08.2021.
//

import Foundation

protocol RegisterViewModelProtocol {
    
}

protocol RegisterViewModelDelegate: AnyObject {
    func showAlert(type: AlertType)
}

class RegisterViewModel: BaseViewModel {
    
    var name: String = ""
    var surname: String = ""
    var username: String = ""
    var email: String = ""
    var password: String = ""
    
    var errorMessage: String = ""
    var successMessage: String = ""
    
    weak var delegate: RegisterViewModelDelegate?
    
    func register(){
        print(name,surname)
        API().register(name: name, surname: surname, username: username, email: email, password: password) { [weak self] (result) in
            switch result {
            case .success(let registerResponse):
                
                if registerResponse.status ?? false {
                    
                    UserDefaults.standard.setValue(registerResponse.user?.token, forKey: "token")
                    UserDefaults.standard.setValue(registerResponse.user?.id, forKey: "userID")
                    
                    self?.successMessage = registerResponse.message ?? ""
                    self?.delegate?.showAlert(type: .success)
                    
                }else {
                    self?.errorMessage = registerResponse.message ?? ""
                    self?.delegate?.showAlert(type: .error)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

