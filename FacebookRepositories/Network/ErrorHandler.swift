//
//  ErrorHandler.swift
//  FacebookRepositories
//
//  Created by huda elhady on 23/01/2021.
//  Copyright © 2021 HudaElhady. All rights reserved.
//

import Foundation

struct ErrorHandler : Error {
    var code : Int
    
    var errorObject : GeneralError {
        if (200..<300).contains(code) {
            return GeneralError(code: 0, message:"parsing error")
        } else if code == 404 {
            return GeneralError(code: 0, message: "404 Not found")
        } else if code == 401 {
            
            return GeneralError(code: 0, message: "session expired please login again")
        } else {
            return GeneralError(code: 0, message: "Something went wrong")
        }
        
    }
    init(code: Int) {
        self.code = code
    }
    
}

struct GeneralError: Codable {
    let code: Int
    let message: String
}




