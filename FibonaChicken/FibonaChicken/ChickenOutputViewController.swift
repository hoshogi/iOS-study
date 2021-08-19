//
//  ChickenOutputViewController.swift
//  FibonaChicken
//
//  Created by 이호석 on 2021/08/19.
//

import UIKit

class ChickenOutputViewController: UIViewController {
    var numberOfPeople: Int = 0
    
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var chickenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        peopleLabel.text = "\(numberOfPeople)명이서\n먹는다면..."
        chickenLabel.text = "\(calculateChicken())마리를 시키거라"
    }
    
    func calculateChicken() -> Int {
        var peopleDivided = Double(numberOfPeople) / 1.618
        var chicken = round(peopleDivided)

        return Int(chicken)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
