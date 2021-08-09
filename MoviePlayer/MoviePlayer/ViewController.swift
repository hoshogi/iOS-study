//
//  ViewController.swift
//  MoviePlayer
//
//  Created by 이호석 on 2021/08/09.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func playVideo(url: NSURL) {
        let playerController = AVPlayerViewController() // AVPlayerViewController의 인스턴스 생성
        let player = AVPlayer(url: url as URL) // 비디오 URL로 초기화된 AVPlayer의 인스턴스 생성
    
        playerController.player = player // AVPlaerViewController의 player 속성에 위에서 생성한 AVPlayer 인스턴스 할당
        self.present(playerController, animated: true) {
            player.play() // 비디오 재생
        }
    }
    
    // 내부 파일 mp4 재생
    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        let filePath: String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4") // 비디오 파일명을 사용하여 비디오가 저장된 앱 내부의 경로를 받아온다
        let url = NSURL(fileURLWithPath: filePath!) // 앱 내부의 파일명을 NSURL 형식으로 변경
        
        playVideo(url: url)
    }
    
    // 외부 파일 mp4 재생
    @IBAction func btnPlayExternalmovie(_ sender: UIButton) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")! // 외부에 링크된 주소를 NSURL 형식으로 변경
       
        playVideo(url: url)
    }
}

