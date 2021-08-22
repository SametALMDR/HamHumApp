//
//  API.swift
//  HamHumApp
//
//  Created by ALEMDAR on 14.08.2021.
//

import Foundation
import Alamofire

enum APIError: Error {
    case urlNotCreated
    case dataNotCreated
    case dataNotDecoded
}

class API {
    
    let apiBaseUrl = ApiConstants.ApiEnv
    
    let apiHeaders: HTTPHeaders = [
        "Accept" : "application/json",
    ]
    
    func login(email: String, password: String ,completion: @escaping(Result<LoginResponse, APIError>) -> ()) {
        
        let endPoint = "/login"
        var requestUrl = "\(apiBaseUrl)\(endPoint)?"
        
        let params = [
            "username": "\(email)",
            "password": "\(password)"
        ]
        
        for param in params {
            requestUrl.append("\(param.key)=\(param.value)&")
        }
        requestUrl.removeLast()
        
        guard let url = URL(string: requestUrl) else {
            completion(.failure(.urlNotCreated))
            return
        }
        
        AF.request(url, method: .post, headers: apiHeaders).response { (response) in
            
           guard let data = response.data else {
               completion(.failure(.dataNotCreated))
               return
           }
            
           do {
                let data = try JSONDecoder().decode(LoginResponse.self, from: data)
                completion(.success(data))
           }catch {
                completion(.failure(.dataNotDecoded))
           }
            
        }
        
    }
    
    func register(name: String, surname: String, username: String, email: String, password: String ,completion: @escaping(Result<RegisterResponse, APIError>) -> ()) {
        
        let endPoint = "/register"
        var requestUrl = "\(apiBaseUrl)\(endPoint)?"
        
        let params = [
            "name": "\(name)",
            "surname": "\(surname)",
            "username": "\(username)",
            "email": "\(email)",
            "password": "\(password)"
        ]
        
        for param in params {
            requestUrl.append("\(param.key)=\(param.value)&")
        }
        requestUrl.removeLast()
        
        guard let url = URL(string: requestUrl) else {
            completion(.failure(.urlNotCreated))
            return
        }
        
        AF.request(url, method: .post, headers: apiHeaders).response { (response) in
            
           guard let data = response.data else {
               completion(.failure(.dataNotCreated))
               return
           }
            
           do {
                let data = try JSONDecoder().decode(RegisterResponse.self, from: data)
                completion(.success(data))
           }catch {
                completion(.failure(.dataNotDecoded))
           }
            
       }
            
    }
    
    func fetchCategories(completion: @escaping(Result<CategoryResponse, APIError>) -> ()) {
        
        let endPoint = "/categories"
        let requestUrl = "\(apiBaseUrl)\(endPoint)"
        
        guard let url = URL(string: requestUrl) else {
            completion(.failure(.urlNotCreated))
            return
        }
        
        AF.request(url, headers: apiHeaders).response { (response) in
            
           guard let data = response.data else {
               completion(.failure(.dataNotCreated))
               return
           }
            
           do {
                let data = try JSONDecoder().decode(CategoryResponse.self, from: data)
                completion(.success(data))
           }catch {
                completion(.failure(.dataNotDecoded))
           }
            
       }
            
    }
    
    func fetchRecommendedFoods(completion: @escaping(Result<RecommendedFoodResponse, APIError>) -> ()) {
        
        let endPoint = "/food/recommended"
        let requestUrl = "\(apiBaseUrl)\(endPoint)"
        
        guard let url = URL(string: requestUrl) else {
            completion(.failure(.urlNotCreated))
            return
        }
        
        AF.request(url, headers: apiHeaders).response { (response) in
            
           guard let data = response.data else {
               completion(.failure(.dataNotCreated))
               return
           }
            
           do {
                let data = try JSONDecoder().decode(RecommendedFoodResponse.self, from: data)
                completion(.success(data))
           }catch {
                completion(.failure(.dataNotDecoded))
           }
            
       }
            
    }
    
    func fetchPopularFoods(completion: @escaping(Result<PopularFoodResponse, APIError>) -> ()) {
        
        let endPoint = "/food/popular"
        let requestUrl = "\(apiBaseUrl)\(endPoint)"
        
        guard let url = URL(string: requestUrl) else {
            completion(.failure(.urlNotCreated))
            return
        }
        
        AF.request(url, headers: apiHeaders).response { (response) in
            
           guard let data = response.data else {
               completion(.failure(.dataNotCreated))
               return
           }
            
           do {
                let data = try JSONDecoder().decode(PopularFoodResponse.self, from: data)
                completion(.success(data))
           }catch {
                completion(.failure(.dataNotDecoded))
           }
            
       }
            
    }
    
    func fetchFoodDetail(id: Int, completion: @escaping(Result<FoodDetailResponse, APIError>) -> ()) {
        
        let endPoint = "/food/detail/\(id)"
        let requestUrl = "\(apiBaseUrl)\(endPoint)"
        
        guard let url = URL(string: requestUrl) else {
            completion(.failure(.urlNotCreated))
            return
        }
        
        AF.request(url, headers: apiHeaders).response { (response) in
            
           guard let data = response.data else {
               completion(.failure(.dataNotCreated))
               return
           }
            
           do {
                let data = try JSONDecoder().decode(FoodDetailResponse.self, from: data)
                completion(.success(data))
           }catch {
                completion(.failure(.dataNotDecoded))
           }
            
       }
            
    }
    
    func fetchSearch(name: String, completion: @escaping(Result<SearchFoodResponse, APIError>) -> ()) {
        
        let endPoint = "/search/\(name.lowercased())"
        let requestUrl = "\(apiBaseUrl)\(endPoint)"
        
        guard let url = URL(string: requestUrl) else {
            completion(.failure(.urlNotCreated))
            return
        }
        
        AF.request(url, headers: apiHeaders).response { (response) in
            
           guard let data = response.data else {
               completion(.failure(.dataNotCreated))
               return
           }
            
           do {
                let data = try JSONDecoder().decode(SearchFoodResponse.self, from: data)
                completion(.success(data))
           }catch {
                completion(.failure(.dataNotDecoded))
           }
            
       }
            
    }
    
    func fetchUserInfo(id: Int, completion: @escaping(Result<UserInfoResponse, APIError>) -> ()) {
        
        let endPoint = "/user/\(id)/information"
        let requestUrl = "\(apiBaseUrl)\(endPoint)"
        
        guard let url = URL(string: requestUrl) else {
            completion(.failure(.urlNotCreated))
            return
        }
        
        AF.request(url, headers: apiHeaders).response { (response) in
            
           guard let data = response.data else {
               completion(.failure(.dataNotCreated))
               return
           }
            
           do {
                let data = try JSONDecoder().decode(UserInfoResponse.self, from: data)
                completion(.success(data))
           }catch {
                completion(.failure(.dataNotDecoded))
           }
            
       }
            
    }
    
}
