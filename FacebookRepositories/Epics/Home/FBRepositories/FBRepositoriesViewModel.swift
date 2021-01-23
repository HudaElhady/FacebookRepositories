//
//  FBRepositoriesViewModel.swift
//  FacebookRepositories
//
//  Created by huda elhady on 23/01/2021.
//  Copyright © 2021 HudaElhady. All rights reserved.
//

import Foundation

class FBRepositoriesViewModel {
    private var fbRepo : FBRepo
    var reposArray: Dynamic<[Repo]> = Dynamic([Repo]())
    var isLoading: Dynamic<Bool> = Dynamic(false)
    var errorMessage: Dynamic<String> = Dynamic("")
    
    
    init(fbRepo: FBRepo) {
        self.fbRepo = fbRepo
    }
    
    func getFBRepo(){
        isLoading.value = true
        fbRepo.getFBRepo { [weak self] (response) in
            self?.isLoading.value = false
            switch response{
            case .success(let repos):
                self?.reposArray.value = repos
            case.failure(let error):
                self?.errorMessage.value = error.errorObject.message
            }
        }
    }
    
}

