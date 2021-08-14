//
//  ViewController.swift
//  UIComponentIf
//
//  Created by 이호석 on 2021/08/15.
//

import UIKit

class ViewController: UIViewController {
    var isBackSide = true
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender: Any) {
        // animation 추가
        UIView.transition(with: imageView, duration: 0.6, options: .transitionFlipFromLeft) {
            if self.isBackSide {
                self.imageView.image = UIImage(named: "ace")
            } else {
                self.imageView.image = UIImage(named: "poker")
            }
        } completion: { (animated) in
            self.isBackSide = !self.isBackSide
        }
    }
}

