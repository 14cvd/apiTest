//
//  UserViewModel.swift
//  DraftProject
//
//  Created by cavID on 06.05.24.
//

import Foundation


protocol IUserViewModel {
    func fetchItem()
    func changeLoading()
    
    var  userDatas : [UserModel] {get set}
    var  userService : IUserService {get}
    
    var delegate : UserModelDelegate? {get}
    func setDelegate(delegate :UserModelDelegate )
}



final class UserViewModel : IUserViewModel {
    var delegate:  UserModelDelegate?
    
    
    func setDelegate(delegate:  UserModelDelegate) {
        self.delegate = delegate
    }
    
    var userDatas : [UserModel] = []
    private var isLoading = false
    let userService : IUserService
    
    
    init() {
        userService = UserService()
    }
    
    
    
    
    
    
    func fetchItem() {
        changeLoading()
        userService.fetchUserData { [weak self] response in
            self?.changeLoading()
            self?.userDatas = response ?? []
            self?.delegate?.saveDatas(values: self?.userDatas ?? [])
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        delegate?.changeLoading(isLoad: isLoading)
    }
    
    
    
}
