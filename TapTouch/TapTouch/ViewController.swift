//
//  ViewController.swift
//  TabTouch
//
//  Created by 이호석 on 2021/08/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtMessage: UILabel!
    @IBOutlet var txtTapCount: UILabel! // Tap Count: 연속으로 몇 번 탭했는지
    @IBOutlet var txtTouchCount: UILabel! // Touch Count: 몇 개의 손가락으로 터치했는지
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 터치가 시작될 때 호출
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch // 현재 발생한 터치 이벤트를 가지고 옵니다
        
        txtMessage.text = "Touches Began"
        txtTapCount.text = String(touch.tapCount) // 터치 객체들 중 첫 번째 객체에서 탭의 개수를 가져와 출력
        txtTouchCount.text = String(touches.count) // touches 세트 안에 포함된 터치의 개수를 출력
    }
    
    // 터치된 손가락이 움직였을 때 호출
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches Moved"
        txtTapCount.text = String(touch.tapCount)
        txtTouchCount.text = String(touches.count)
    }
    
    // 손가락을 떼었을ㄷ 때 호출
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtMessage.text = "Touches Ended"
        txtTapCount.text = String(touch.tapCount)
        txtTouchCount.text = String(touches.count)
    }
}

