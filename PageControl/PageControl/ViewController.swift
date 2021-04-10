//
//  ViewController.swift
//  PageControl
//
//  Created by 이호석 on 2021/04/10.
//

import UIKit

var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.green // 페이지 컨트롤의 페이지를 표시하는 부분의 색상 설정
        pageControl.currentPageIndicatorTintColor = UIColor.red // 페이지 컨트롤의 현재 페이지를 표시하는 색상 설정
        
        imgView.image = UIImage(named: images[0])
    }

    // page가 변하면 호출됨
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
}
