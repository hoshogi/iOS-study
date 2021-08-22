//
//  ViewController.swift
//  BookReview
//
//  Created by 이호석 on 2021/08/20.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AF.request("http://spartacodingclub.shop/review").responseJSON { (response) in // get
            var json = JSON(response.value!)
            
            print(json["reviews"][0])
        }
        
        var parameters = [ // dictionary
            "title_give": "너무나도 쉬운 iOS 개발",
            "author_give": "스위프트",
            "review_give": "재밌어요!"
        ]

        AF.request("http://spartacodingclub.shop/review", method: .post, parameters: parameters).responseJSON { (response) in // post
            var json = JSON(response.value!)
            
            print(json)
        }
    }
}

