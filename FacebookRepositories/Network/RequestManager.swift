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
    
    static func apiCall<T : Decodable>(responseModel: T.Type, request : APIManager,  completionHandeler: @escaping (Result<T,ErrorHandler>) -> Void) {
        AF.request(request).responseData { (response : AFDataResponse<Data>) in
            
            guard let statusCode = (response.response?.statusCode)
                else{
                completionHandeler(.failure(ErrorHandler(code: 500)))
                    return
            }
            switch response.result{
            case .success(let result):
                guard !result.isEmpty else {
                    completionHandeler(.failure(ErrorHandler(code: statusCode)))
                    return
                }
                    guard (200...299).contains(statusCode), let obj = try? JSONDecoder().decode(T.self, from: result) else {
                        completionHandeler(.failure(ErrorHandler(code: statusCode)))
                        return
                    }
                    completionHandeler(.success(obj))
            case .failure:
                completionHandeler(.failure(ErrorHandler(code: statusCode)))
            }
        }
    }
}

