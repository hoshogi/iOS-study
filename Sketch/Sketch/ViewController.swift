//
//  ViewController.swift
//  Sketch
//
//  Created by 이호석 on 2021/08/14.
//

import UIKit

class ViewController: UIViewController {
    var lastPoint: CGPoint! // 바로 전에 터치하거나 이동한 위치
    var lineSize: CGFloat = 2.0 // 선의 두께
    var lineColor = UIColor.red.cgColor // 선의 색상
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clearImageView(_ sender: UIButton) {
        imgView.image = nil // 이미지 뷰의 이미지 삭제
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch // 현재 발생한 터치 이벤트
        
        lastPoint = touch.location(in: imgView) // 터치된 위치 저장
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size) // 그림을 그리기 위한 컨텍스트 생성
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round) // 라인의 끝 모양을 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch // 현재 발생한 터치 이벤트
        let currPoint = touch.location(in: imgView) // 터치된 위치
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height)) // 현재 이미지 뷰에 있는 이미지를 이미지 뷰의 크기로 그린다
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y)) // 이전에 이동된 위치인 lastPoint로 시작 위치를 이동 시킨다
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y)) // lastPoint에서 현재 위치인 currPoint까지 선 추가
        UIGraphicsGetCurrentContext()?.strokePath() // 추가한 선을 컨텍스트에 그림
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext() // 혅재 컨텍스트에 그려진 이미지를 가지고 와서 이미지 뷰에 할당
        UIGraphicsEndImageContext() // 그림 그리기를 끝냄
        
        lastPoint = currPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        let currPoint = touch.location(in: imgView)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // 사용자가 iOS 기기를 흔들었을 때 호출
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if  motion == .motionShake { // iOS 기기를 흔드는 모션이 발생하면
            imgView.image = nil // 이미지 뷰의 이미지 삭제
        }
    }
}
