//
//  APIManager.swift
//  FacebookRepositories
//
//  Created by huda elhady on 23/01/2021.
//  Copyright © 2021 HudaElhady. All rights reserved.
//

import Foundation
import Alamofire

enum APIManager: URLRequestConvertible {
    enum Constants{
        static var baseUrl = "https://pastebin.com/raw/"
    }
    
    case fbRepos
    
    var url : URL {
        switch self {
        case .fbRepos:
            return URL(string: "\(Constants.baseUrl)bkf64ZUr")!
        }

    }
    
    var method : HTTPMethod {
        return .get
    }
    
    var parameters : [String:Any]{
        return [:]
    }
    var headers : HTTPHeaders {
        return [:]
    }

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        urlRequest.headers = headers
        
        switch method {
        case .get, .delete:
           return try URLEncoding.default.encode(urlRequest, with: parameters)
        default:
            return try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }
}

