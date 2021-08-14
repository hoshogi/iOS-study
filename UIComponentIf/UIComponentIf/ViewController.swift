//
//  ViewController.swift
//  UIComponentIf
//
//  Created by 이호석 on 2021/08/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var onOffSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onOffSwitchValueChanged(_ sender: Any) {
        // animation 추가
        UIView.transition(with: imageView, duration: 0.6, options: .transitionFlipFromLeft) {
            if self.onOffSwitch.isOn {
                self.imageView.image = UIImage(named: "ace")
            } else {
                self.imageView.image = UIImage(named: "poker")
            }
        } completion: { (animated) in
            
        }
    }
}

