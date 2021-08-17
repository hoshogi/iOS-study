//
//  ViewController.swift
//  RamenTimer
//
//  Created by 이호석 on 2021/08/17.
//

import UIKit

class ViewController: UIViewController {
    var secondsLeft: Int = 180
    var timer:Timer?
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timerButton.layer.cornerRadius = 10
        
        self.updateTimeLeft()
    }
  
    func updateTimerLabel() {
        var minutes = self.secondsLeft / 60
        var seconds = self.secondsLeft % 60
        
        if self.secondsLeft < 10 {
            self.timerLabel.textColor = UIColor.red
        } else {
            self.timerLabel.textColor = UIColor.black
        }
        
        UIView.transition(with: self.timerLabel, duration: 0.3, options: .transitionFlipFromBottom) {
            if self.secondsLeft > 0 {
                self.timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
            } else {
                self.timerLabel.text = "시간 끝!"
            }
        } completion: { (animated) in
            
        }
    }
    
    func updateTimeLeft() {
        self.secondsLeft = 180 + 60 * segmentControl.selectedSegmentIndex
        self.updateTimerLabel()
    }
    
    func resetTimer() {
        timer?.invalidate() // 타이머 끄기
        timer = nil // 타이머 지우기
        timerButton.setTitle("타이머 시작하기", for: .normal)
    }

    @IBAction func timerButtonClicked(_ sender: Any) {
        if timer != nil {
            resetTimer()
            return
        }
        
        self.timerButton.setTitle("타이머 종료하기", for: .normal)
        self.updateTimeLeft()
        
        // 1초마다 반복하는 Timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t) in
            self.secondsLeft -= 1
            self.updateTimerLabel()
            
            if self.secondsLeft == 0 {
                self.resetTimer()
            }
        }
    }
    
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        self.resetTimer()
        self.updateTimeLeft()
    }
}

