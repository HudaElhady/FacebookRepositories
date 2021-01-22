//
//  License.swift
//  FacebookRepositories
//
//  Created by huda elhady on 23/01/2021.
//  Copyright © 2021 HudaElhady. All rights reserved.
//

import Foundation

struct License : Codable {

    let key : String?
    let name : String?
    let nodeId : String?
    let spdxId : String?
    let url : String?


    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
        case nodeId = "node_id"
        case spdxId = "spdx_id"
        case url = "url"
    }

}
