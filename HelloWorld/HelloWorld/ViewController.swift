//
//  ViewController.swift
//  HelloWorld
//
//  Created by 이호석 on 2021/02/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblHello: UILabel! // 출력 레이블용 아웃렛 변수
    @IBOutlet var txtName: UITextField! // 이름 입력용 아웃렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        // "Hello, "라는 문자열고 ㅏtxtName.text의 문자열을 결합하여 lblHello.txt에 넣음
        lblHello.text = "Hello, " + txtName.text!
    }
}
