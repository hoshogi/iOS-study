//
//  ViewController.swift
//  PinchGestureImage
//
//  Created by 이호석 on 2021/08/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgPinch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 핀치 제스처는 UIPinchGestureRecognizer 클래스에 의해 인식
        // 액션 인수는 핀치 제스처가 인식 되었을 때 실행할 메서드
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch) // 뷰 객체에 핀치 제스처 등록
    }

    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale) // 이미지를 scale에 맞게 변환
        pinch.scale = 1 // 다음 변환을 위해서 pinch의 scale을 1로 설정
    }
}
