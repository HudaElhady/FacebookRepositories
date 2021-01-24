//
//  FBRepositoriesViewController.swift
//  FacebookRepositories
//
//  Created by huda elhady on 23/01/2021.
//  Copyright © 2021 HudaElhady. All rights reserved.
//

import UIKit

class FBRepositoriesViewController: UIViewController {
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var reposCollectionView: UICollectionView!
    var viewModel = FBRepositoriesViewModel(fbRepo: FBRepoImpl())
    var reposArray = [RepoPresenter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initObservables()
        viewModel.getFBRepo()
    }
    
    private func initObservables() {
        viewModel.reposArray.bind { [weak self] repos in
            self?.reposArray = repos
            self?.reposCollectionView.reloadData()
        }
        
        viewModel.errorMessage.bind { [weak self] error in
            self?.alert(message: error, actions: [("OK", .cancel)])
        }
        
        viewModel.isLoading.bind { [weak self] isSpanning in
            isSpanning ? self?.activityIndicator.startSpinner(): self?.activityIndicator.stopSpinner()
        }
    }
}

//MARK:- UICollection View DataSource Method

extension FBRepositoriesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reposArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RepoCell", for: indexPath) as? RepoCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(repo: reposArray[indexPath.row])
        return cell
    }
}

//MARK:- UICollection View Delegate FlowLayout Method

extension FBRepositoriesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = reposArray[indexPath.row]
        let width = (UIScreen.main.bounds.width - 40)
        let height = (item.descriptionField.height(withConstrainedWidth: width - 60, font: UIFont.systemFont(ofSize: 16.0))) + 130
        return CGSize(width: width, height: height)
    }

}

