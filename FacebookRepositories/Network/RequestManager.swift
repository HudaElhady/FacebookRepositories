//
//  RequestManager.swift
//  FacebookRepositories
//
//  Created by huda elhady on 23/01/2021.
//  Copyright © 2021 HudaElhady. All rights reserved.
//

import Foundation
import Alamofire

class RequestManager{
    private static let system = SystemUtilsImpl()
    
    static func apiCall(request : APIManager,  completionHandeler: @escaping (Result<Data,ErrorHandler>) -> Void) {
        AF.request(request).responseData { (response : AFDataResponse<Data>) in
            guard let statusCode = (response.response?.statusCode)
            else{
                completionHandeler(.failure(ErrorHandler(code: 500)))
                return
            }
            switch response.result{
            case .success(let result):
                guard !result.isEmpty, (200...299).contains(statusCode) else {
                    completionHandeler(.failure(ErrorHandler(code: statusCode)))
                    return
                }
                completionHandeler(.success(result))
            case .failure:
                let code = system.isNetworkRechable() ? 0 : statusCode
                completionHandeler(.failure(ErrorHandler(code: code)))
            }
        }
    }
}

