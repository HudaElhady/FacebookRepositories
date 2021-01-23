//
//  Dynamic.swift
//  FacebookRepositories
//
//  Created by huda elhady on 23/01/2021.
//  Copyright © 2021 HudaElhady. All rights reserved.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?

    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }

    func bind(_ listener: Listener?) {
        self.listener = listener
    }

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }
}
