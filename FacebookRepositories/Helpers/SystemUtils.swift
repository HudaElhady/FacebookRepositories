//
//  SystemUtils.swift
//  FacebookRepositories
//
//  Created by huda elhady on 24/01/2021.
//  Copyright © 2021 HudaElhady. All rights reserved.
//

import Foundation

protocol SystemUtils {
    func isNetworkRechable() -> Bool
}

class SystemUtilsImpl: SystemUtils {

    private func checkConnection() -> Bool {
         guard let reachability = try? Reachability.init() else { return false}
        switch reachability.connection {
         case .unavailable:
             return false
         default :
             return true
         }
     }

    func isNetworkRechable() -> Bool {
        return checkConnection()
    }
}
