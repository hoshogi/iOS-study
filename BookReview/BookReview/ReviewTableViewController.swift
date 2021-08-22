//
//  ReviewTableViewController.swift
//  BookReview
//
//  Created by 이호석 on 2021/08/21.
//

import UIKit
import SwiftyJSON
import Alamofire

class ReviewTableViewController: UITableViewController {

    var reviews: [JSON] = [] //  JSON 타입을 사용하기 위해 import SwiftyJSON 필요
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // 뷰가 뜨기 직전에
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AF.request("http://spartacodingclub.shop/review").responseJSON { (response) in
            if var value = response.value { // nil이 아니면
                var json = JSON(value)
                self.reviews = json["reviews"].arrayValue // arrayValue: array라는 것을 알려준다
                
                self.tableView.reloadData() // TableView를 새로고침 하는 방법
            }
            
        }
    }
    
    // MARK: - Table view data source

    // section 개수
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // row 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.reviews.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) // ReviewCell 가져오기

        // Configure the cell...
        var review = reviews[indexPath.row]
        cell.textLabel?.text = "\(review["author"].stringValue) - \(review["title"].stringValue)" // title
        cell.detailTextLabel?.text = review["review"].stringValue // subtitle
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
