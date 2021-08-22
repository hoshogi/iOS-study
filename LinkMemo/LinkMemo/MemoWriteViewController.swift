//
//  MemoWriteViewController.swift
//  LinkMemo
//
//  Created by 이호석 on 2021/08/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class MemoWriteViewController: UIViewController {
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var CommetTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlTextField.layer.cornerRadius = 10
        urlTextField.layer.borderWidth = 1
        urlTextField.layer.borderColor = UIColor.gray.cgColor
        urlTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0)) // 왼쪽 여백
        urlTextField.leftViewMode = .always
        
        CommetTextField.layer.cornerRadius = 10
        CommetTextField.layer.borderWidth = 1
        CommetTextField.layer.borderColor = UIColor.gray.cgColor
        CommetTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0)) // 왼쪽 여백
        CommetTextField.leftViewMode = .always
    }
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        var url = urlTextField.text ?? ""
        var comment = CommetTextField.text ?? ""
        
        if url.count == 0 || comment.count == 0 { // 하나라도 입력이 되지 않았으면
            var alert = UIAlertController(title: "모두의 링크 메모장", message: "모두 입력해주세요!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        var parameters = [
            "url_give": url,
            "comment_give": comment
        ]
        
        AF.request("http://spartacodingclub.shop/post", method: .post, parameters: parameters).responseJSON { (response) in // post
            if var value = response.value {
                var json = JSON(value)
                
                self.navigationController?.popViewController(animated: true)
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
