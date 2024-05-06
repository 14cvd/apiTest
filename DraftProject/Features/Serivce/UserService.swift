//
//  UserService.swift
//  DraftProject
//
//  Created by cavID on 06.05.24.
//

import Foundation
import Alamofire

enum UserServiceEndPoint: String {
    case baseUrl = "https://jsonplaceholder.typicode.com"
    case path = "/posts"
    
    
    static func userPath () -> String {
        return "\(baseUrl.rawValue)\(path.rawValue)"
    }
}



protocol IUserService {
    func fetchUserData (response : @escaping (([UserModel]?) -> Void ))
}



struct UserService : IUserService {
    func fetchUserData(response: @escaping (([UserModel]?) -> Void)) {
        AF.request(UserServiceEndPoint.userPath()).responseDecodable(of: UserModel.self) { model in
            guard let data = model.value else {
                response(nil)
                return
            }
            
            
            response([data])
    
        }
        
            
        
    }
    
    
}
