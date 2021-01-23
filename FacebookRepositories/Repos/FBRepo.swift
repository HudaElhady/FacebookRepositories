//
//  FBRepo.swift
//  FacebookRepositories
//
//  Created by huda elhady on 23/01/2021.
//  Copyright © 2021 HudaElhady. All rights reserved.
//

import Foundation

protocol FBRepo {
    func getFBRepo(completionHandeler: @escaping (Result<[Repo], ErrorHandler>) -> Void)
}

class FBRepoImpl: FBRepo {
    func getFBRepo(completionHandeler: @escaping (Result<[Repo], ErrorHandler>) -> Void){
        RequestManager.apiCall(request: .fbRepos) { response in
            switch response {
            case .success(let result):
                guard let repos = try? JSONDecoder().decode([Repo].self, from: result) else {
                    completionHandeler(.failure(ErrorHandler(code: 200)))
                    return
                }
                completionHandeler(.success(repos))
            case .failure(let error):
                completionHandeler(.failure(error))
            }
        }
    }
}
