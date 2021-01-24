//
//  RepoCollectionViewCell.swift
//  FacebookRepositories
//
//  Created by huda elhady on 23/01/2021.
//  Copyright © 2021 HudaElhady. All rights reserved.
//

import UIKit
import Kingfisher

class RepoCollectionViewCell: UICollectionViewCell {
    
    //MARK:- IBOutlets
    @IBOutlet private weak var ownerImageView: UIImageView!
    @IBOutlet private weak var repoNameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var forksCountLabel: UILabel!
    @IBOutlet private weak var forkImageView: UIImageView!

    func configure(repo: RepoPresenter){
        ownerImageView.kf.setImage(with: URL(string: repo.avatarUrl))
        repoNameLabel.text = repo.name
        descriptionLabel.text = repo.descriptionField
        forksCountLabel.text = repo.forksCount
        forkImageView.image = repo.isForked ? #imageLiteral(resourceName: "ic_fork") : #imageLiteral(resourceName: "ic_no_fork")
    }
    
}

