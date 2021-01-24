//
//  ViewController+Extension.swift
//  FacebookRepositories
//
//  Created by huda elhady on 23/01/2021.
//  Copyright © 2021 HudaElhady. All rights reserved.
//

import UIKit

extension UIViewController{
    func alert(title: String = "", message: String, actions: [(String, UIAlertAction.Style)]) {
        
        let alerting = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alerting.addAction(UIAlertAction(title: action.0, style: action.1, handler: nil))
        }
        self.present(alerting, animated: true, completion: nil)
    }
}
