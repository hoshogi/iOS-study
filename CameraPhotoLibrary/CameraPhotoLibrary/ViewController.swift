//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by 이호석 on 2021/08/09.
//

import UIKit
import MobileCoreServices // 다양한 타입들을 정의해 놓은 헤더 파일 추가

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    
    var captureImage: UIImage! // 촬영 하거나 포토 라이브러리에서 불러온 사진을 저장할 변수
    var videoURL: URL! // 녹화한 비디오의 URL을 저장할 변수
    var flagImageSave = false // 사진 저장 여부를 나타낼 변수
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 사용자가 사진이나 비디오를 촬영하거나 포토 라이브러리에서 선택이 끝났을 때 호출되는 didFinishPikcingWithInfo 델리게이트 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString // 미디어 종류 확인
        
        if mediaType.isEqual(to: kUTTypeImage as NSString as String) { // 미디어 종류가 사진일 경우
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage // 사진을 가져와 captureImage에 저장
            
            // flagImageSave가 참이면 가져온 사진을 포토 라이브러리에 저장
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            imgView.image = captureImage
        } else if mediaType.isEqual(to: kUTTypeMovie as NSString as String) { // 미디어 종류가 비디오일 경우
            if flagImageSave {
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL) // 비디오를 가져옴
                
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil) // 비디오를포토 라이브에 저장
            }
        }
        
        self.dismiss(animated: true, completion: nil) // 현재의 뷰 컨트롤러를 제거한다. 즉, 뷰에서 이미지 피커 화면을 제거하여 초기 뷰를 보여 준다.
    }
    
    // 사용자가 사진이나 비디오를 찍지 않고 취소하거나 선택하지 않고 취소를 하는 경우
    // 다시 처음의 뷰 상타로 돌아가야 하므로 현재의 뷰 컨트롤러에 보이는 이미지 피커를 제거하여 초기 뷰를 보여 준다
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 경고창 출력 함수
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

    // 사진 촬영하기
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) { // 카메라의 사용 가능 여부 확인
            flagImageSave = true // 카메라 촬영 후 저장할 것이기 때문에 이미지 저장 허용
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false // 편집 허용하지 않는다
            
            present(imagePicker, animated: true, completion: nil) // 현재 뷰 컨트롤러를 imagePicker로 대체. 즉, 뷰에 imagePikcer가 보이게 한다
        } else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.") // 카메라를 사용할 수 없을때는 경고창을 나타낸다
        }
    }
    
    // 사진 불러오기
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    
    // 비디오 촬영하기
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) { // 카메라의 사용 가능 여부 확인
            flagImageSave = true // 카메라 촬영 후 저장할 것이기 때문에 이미지 저장 허용
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false // 편집 허용하지 않는다
            
            present(imagePicker, animated: true, completion: nil) // 현재 뷰 컨트롤러를 imagePicker로 대체. 즉, 뷰에 imagePikcer가 보이게 한다
        } else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.") // 카메라를 사용할 수 없을때는 경고창을 나타낸다
        }
    }
    
    // 비디오 불러오기
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
}

