//
//  ActivityIndicator+Extension.swift
//  FacebookRepositories
//
//  Created by huda elhady on 24/01/2021.
//  Copyright © 2021 HudaElhady. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
    func startSpinner() {
        startAnimating()
        isHidden = false
        isUserInteractionEnabled = false
    }

    func stopSpinner() {
        stopAnimating()
        isHidden = true
        isUserInteractionEnabled = true
    }
}
