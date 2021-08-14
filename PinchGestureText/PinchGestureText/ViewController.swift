//
//  ViewController.swift
//  PinchGesture
//
//  Created by 이호석 on 2021/08/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtPinch: UILabel!
    
    var initialFontSize: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 핀치 제스처는 UIPinchGestureRecognizer 클래스에 의해 인식
        // 액션 인수는 핀치 제스처가 인식 되었을 때 실행할 메서드
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch) // 뷰 객체에 핀치 제스처 등록
    }

    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        if (pinch.state == UIGestureRecognizer.State.began) { // 핀치 제스처의 상태를 state 속성을 사용하여 확인하여 시작이면
            initialFontSize = txtPinch.font.pointSize // 현재 텍스트의 크기를 저장
        } else { // 핀치 제스처의 상태가 시작이 아니면 계속 진행되고 있는 상태이므로
            // intialFontSize에 저장해 둔 글자 크기 값에 scale 속성을 곱하여 텍스트의 글자 크기에 반영
            txtPinch.font = txtPinch.font.withSize(initialFontSize * pinch.scale)
        }
    }
}

