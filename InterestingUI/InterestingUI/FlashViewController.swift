//
//  FlashViewController.swift
//  InterestingUI
//
//  Created by 이호석 on 2021/08/18.
//

import UIKit

class FlashViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func onButtonClicked(_ sender: Any) {
        view.backgroundColor = UIColor(red: 60/255.0, green: 180/255.0, blue: 220/255.0, alpha: 1)
        label.textColor = UIColor.black
        imageView.image = UIImage(systemName: "flashlight.on.fill")
    }
    
    @IBAction func offButtonClicked(_ sender: Any) {
        view.backgroundColor = UIColor.black
        label.textColor = UIColor.white
        imageView.image = UIImage(systemName: "flashlight.off.fill")
    }
}
