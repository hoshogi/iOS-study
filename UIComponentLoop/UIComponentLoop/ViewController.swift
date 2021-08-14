//
//  ViewController.swift
//  UIComponentLoop
//
//  Created by 이호석 on 2021/08/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender: Any) {
        for i in 0..<textFields.count {
            let textField = textFields[i]
            
            if i % 2 == 0 {
                textField.text = "홀수번째만 텍스트가 들어갑니다!"
            }
        }
        
        /* 위와 같은 코드
        var i = 0
        
        for textField in textFields {
            if i % 2 == 0 {
                textField.text = "홀수번째만 텍스트가 들어갑니다!"
            }
        
            i += 1
        }
        */
    }
}

