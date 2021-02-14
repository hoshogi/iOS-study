//
//  ViewController.swift
//  ImageView
//
//  Created by 이호석 on 2021/02/14.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false // 이미지 확대 여부를 나타내는 bool 타입의 변수
    var imgOn: UIImage? // 켜진 전구 이미지를 가지고 있는 UIImage 타입의 변수
    var imgOff: UIImage? // 꺼진 전구 이미지를 가지고 있는 UIImage 타입의 변수
    
    @IBOutlet var imgView: UIImageView! // 이미지 뷰에 대한 아웃렛 변수
    @IBOutlet var btnResize: UIButton! // 버튼에 대한 아웃렛 변수
    
    // viewDidLoad(): 내가 만든 뷰를 불러왔을 때 호출되는 함수
    // 부모 클래스인 UIViewController 클래스에 선언 되어 있다
    // 뷰가 불려진 후 실행하고자 하는 기능이 필요할 때 이 함수에 코드를 입력하면 된다
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png") // imgOn에 "lamp_on.png" 이미지를 할당
        imgOff = UIImage(named: "lamp_off.png") // imgOff에 "lamp_off.png" 이미지를 할당
        
        imgView.image = imgOn // 위에서 할당한 imgOn 이미지를 imgView에 할당
    }

    // [확대]/[축소] 버튼에 대한 액션 함수
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0 // 확대할 배율 값
        var newWidth: CGFloat, newHeight: CGFloat // 확대할 크기의 계산 값을 보관할 변수
        
        if isZoom { // true 현재 확대된 그림일 경우 (즉, 타이틀은 축소)
            newWidth = imgView.frame.width / scale // 이미지 뷰의 프래임 너비값을 scale 값으로 나눔
            newHeight = imgView.frame.height / scale // 이미지 뷰의 프레임 높이값을 scale 값으로 나눔
            
            btnResize.setTitle("확대", for: .normal) // 버튼의 타이틀을 "확대"로 변경
        } else { // false 현재 축소된 그림일 경우 (즉, 타이틀은 확대)
            newWidth = imgView.frame.width * scale // 이미지 뷰의 프레임 너비값을 scale 값으로 곱함
            newHeight = imgView.frame.height * scale // 이미지 뷰의 프레임 높이값을 scale 값으로 곱함
            
            btnResize.setTitle("축소", for: .normal) // 버튼의 타이틀을 "축소"로 변경
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight) // 이미지 뷰의 프레임 크기를 수정된 너비와 높이로 변경
        isZoom = !isZoom // isZoom 변수의 상태를 ! 연산자를 사용하여 반전
    }
    
    // ON/OFF 스위치에 대한 액션 함수
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn { // 스위치가 ON 일때
            imgView.image = imgOn // 이미지 뷰의 이미지에 imgOn 이미지를 할당
        } else { // 스위치가 OFF 일때
            imgView.image = imgOff // 이미지 뷰의 이미지에 imgOff 이미지를 할당
        }
    }
}
