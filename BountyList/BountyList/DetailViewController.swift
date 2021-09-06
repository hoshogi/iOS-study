//
//  DetailViewController.swift
//  BountyList
//
//  Created by 이호석 on 2021/08/28.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MVVM
    
    // Model
    // - BountyInfo
    // > BountyInfo 만들기
    
    // View
    // - imgView, nameLabel, bountyLabel
    // > View들은 ViewModel을 통해서 구성하기
    
    // ViewModel
    // - DetailViewModel
    // > View Layer에서 필요한 메서드 만들기
    // > Model 가지고 있기 ,, BountyInfo 들
    
    let viewModel = DetailViewModel()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        if let bountyInfo = viewModel.bountyInfo {
            imageView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// ViewModel
class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
