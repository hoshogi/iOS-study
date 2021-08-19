//
//  ChickenInputViewController.swift
//  FibonaChicken
//
//  Created by 이호석 on 2021/08/19.
//

import UIKit

class ChickenInputViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultButton.layer.cornerRadius = 10
        // resultButton.clipsToBounds = true // conerRadius가 잘 안될때 이 코드 사용
    }
    
    @IBAction func textEditingChanged(_ sender: Any) {
        var text = textField.text ?? "" // nil이면 default 값으로 "" 넣기
       
        stepper.value = Double(text) ?? 0
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        var value = stepper.value
        
        textField.text = String(Int(value))
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if var controller = segue.destination as? ChickenOutputViewController { // casting
            controller.numberOfPeople = Int(stepper.value)
        }
    }

}
