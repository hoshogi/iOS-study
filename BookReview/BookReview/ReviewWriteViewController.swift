//
//  ReviewWriteViewController.swift
//  BookReview
//
//  Created by 이호석 on 2021/08/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class ReviewWriteViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var ReviewTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        var title = titleTextField.text ?? ""
        var author = authorTextField.text ?? ""
        var review = ReviewTextField.text ?? ""
        
        if title.count == 0 || author.count == 0 || review.count == 0 {
            var alert = UIAlertController(title: "책 리뷰", message: "모두 입력해주세요!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        var parameter = [
            "title_give": title,
            "author_give": author,
            "review_give": review
        ]
        
        AF.request("http://spartacodingclub.shop/review", method: .post, parameters: parameter).responseJSON { (response) in
            if var value = response.value {
                print(JSON(value))
                
                self.navigationController?.popViewController(animated: true) // 화면을 사라지게 한다
            }
        }
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
