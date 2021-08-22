//
//  MemoDetailViewController.swift
//  LinkMemo
//
//  Created by 이호석 on 2021/08/22.
//

import UIKit
import SwiftyJSON

class MemoDetailViewController: UIViewController {
    var memo: JSON!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var commentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.sd_setImage(with: URL(string: memo["image"].stringValue), completed: nil)
        contentTextView.text = memo["desc"].stringValue
        commentTextView.text = memo["comment"].stringValue
        self.title = memo["title"].stringValue // 상단 네비게이션 바 타이틀
        
    }
    
    @IBAction func linkButtonClicked(_ sender: Any) {
        var url = URL(string: memo["url"].stringValue)
        
        UIApplication.shared.open(url!, options: [:], completionHandler: nil) // 인터넷 열기 
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
