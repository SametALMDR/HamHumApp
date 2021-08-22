//
//  ProfileViewModel.swift
//  HamHumApp
//
//  Created by ALEMDAR on 22.08.2021.
//

import Foundation

protocol ProfileViewModelProtocol {
    func load()
}

protocol ProfileViewModelDelegate: AnyObject {
    func dataLoaded()
}

class ProfileViewModel: BaseViewModel {
    
    var user: User?
    
    weak var delegate: ProfileViewModelDelegate?
    
    private func fetchUserInfo(){
        
        let uid = UserDefaults.standard.integer(forKey: "userID")
        print(uid)
        API().fetchUserInfo(id: uid) { [weak self] (result) in
            switch result {
            case .success(let userInfoResponse):
                self?.user = userInfoResponse.user
                self?.delegate?.dataLoaded()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension ProfileViewModel: ProfileViewModelProtocol {
    
    func load() {
        fetchUserInfo()
    }
    
}
