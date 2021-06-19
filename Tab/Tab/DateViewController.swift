//
//  ViewController.swift
//  DatePicker
//
//  Created by 이호석 on 2021/02/14.
//

import UIKit

class DateViewController: UIViewController {
    // Selector: 함수를 직접 지정하는 기능을 가진 일종의 함수 선택자
    // Selector는 본래 Objective-C에서 클래스 메서드의 이름을 가르키는데 사용되는 참조 타입
    // Swift로 넘어오면서 구조체 형식으로 정의되고, #selector()구문을 사용하여 해당 타입의 값을 생성할 수 있게 되었다
    let timeSelector: Selector = #selector(DateViewController.updateTime) // 타이머가 구동되면 실행할 함수
    let interval = 1.0 // 타이머 간격 1.0초
    var count = 0 // 타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수
    
    @IBOutlet var lblCurrentTime: UILabel! // 현재 시간 레이블의 아웃렛 변수
    @IBOutlet var lblPickerTime: UILabel! // 선택 시간 레이블의 아웃렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // timeInterval: 타이머 간격, target: 동작할 view, selector: 타이버가 구동될 때 실행할 함수, userInfo: 사용자 정보, repeats: 반복 여부
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true) // 타이머 설정
    }


    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender // 전달된 인수 저장

        let formatter = DateFormatter() // DateFormatter 클래스 상수 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" // formatter의 dateFormat 속성을 설정
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date) // 데이터 피커에서 선택한 날짜를 formatter의 dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열로 변환
    }
    
    // 타이머가 구동된 후 정해진 시간이 되었을 때 실행할 함수
    // Selector 타입으로 전달할 메서드를 작성할 때 반드시 @objc 어트리뷰트를 붙여주어야 한다
    // 이는 Objective-C와의 호환성을 위한 것으로, Swift에서 정의한 메서드를 Objective-C에서도 인식할 수 있게 해준다
    @objc func updateTime() {
        // count 값을 문자열로 변환하여 lblCurrentTime.text 출력
        // lblCurrentTime.text = String(count)
        // count += 1 // count 값을 1 증가
        
        let date = NSDate() // 현재 시간을 가져옴
        
        let formatter = DateFormatter() // DateFormatter 클래스 상수 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE" // formatter의 dateFormat 속성을 설정
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date) // 현재 날짜(date)를 formatter의 dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열로 변환
    }
}
