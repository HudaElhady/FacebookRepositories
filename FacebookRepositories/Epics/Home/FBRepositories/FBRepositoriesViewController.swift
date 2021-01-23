//
//  FBRepositoriesViewController.swift
//  FacebookRepositories
//
//  Created by huda elhady on 23/01/2021.
//  Copyright © 2021 HudaElhady. All rights reserved.
//

import UIKit

class FBRepositoriesViewController: UIViewController {

    var viewModel = FBRepositoriesViewModel(fbRepo: FBRepoImpl())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getFBRepo()
    }
    

}
