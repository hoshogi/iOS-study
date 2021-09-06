//
//  BountyInfo.swift
//  BountyList
//
//  Created by 이호석 on 2021/09/05.
//

import UIKit

// Model

struct BountyInfo {
    let name: String
    let bounty: Int

    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
