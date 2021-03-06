//
//  ViewController.swift
//  Alert
//
//  Created by 이호석 on 2021/02/25.
//

import UIKit

class ViewController: UIViewController {
    // 켜진 전구 이미지, 꺼진 전구 이미지, 제거된 전구 이미지의 상수
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    // 전구 상태를 나타내는 변수
    var isLampOn = true
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lampImg.image = imgOn // 앱 실행 시 켜진 전구 이미지가 나타남
    }


    @IBAction func btnLampOn(_ sender: UIButton) {
        if (isLampOn == true) { // 전구가 켜져 있을 때 전구가 켜져 있다고 Alert을 실행함
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert) //UIAlertController를 실행
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil) // UIAlertAction을 생성 (특별한 동작을 하지 않을 경우에는 handler를 nil로 합니다)
            lampOnAlert.addAction(onAction) // 생성된 onAction을 Alert에 추가
            present(lampOnAlert, animated: true, completion: nil) // present 메서드를 실행
        } else { // 전구가 켜져 있지 않을 때 전구를 켬
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        // 전구가 켜져 있을 경우 전구를 끌 것인지를 묻는 Alert을 실행
        if isLampOn {
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            // 전구를 꺼야하므로 handler에 중괄호 { }를 넣어 추가적으로 작업을 합니다
            // Closure: 함수 이름을 선언하지 않고 바로 함수 몸체만 만들어 사용하는 일회용 함수
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                // 컴파일러가 매개변수의 파라미터 타입을 알고 있다면 생략가능
                Action in self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
           
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        // 전구를 제거할 것인지 묻고 '켜기', '끄기', '제거'의 세 가지 동작 중에서 선택해 실행
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off).", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        // handler 매개변수를 삭제하고 뒤쪽에 { }를 넣는 방법을 이용
        // 위의 방법과 아래의 방법 모두 에러없이 동작을 구현
        let onAction = UIAlertAction(title: "아니오, 켭니다(on).", style: UIAlertAction.Style.default) {
            ACTION in self.lampImg.image = self.imgOn
            self.isLampOn = true
        }
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}
