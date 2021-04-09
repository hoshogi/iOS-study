//
//  ViewController.swift
//  Map
//
//  Created by 이호석 on 2021/04/09.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 정확도를 최고로 설정
        locationManager.requestWhenInUseAuthorization() // 위치 데이터를 추적하기 위해 사용자에게 승인을 요구
        locationManager.startUpdatingLocation() // 위치 업데이트를 시작
        myMap.showsUserLocation = true // 위치 보기 값을 true로 설정
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
       
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }

    // 특정 위도와 경도에 핀 설치하고 핀에 타이틀과 서브 타이틀의 문자열 표시
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String) {
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    // 위치 정보에서 국가, 지역, 도로를 추출하여 레이블에 표시
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last // 위치가 업데이트되면 먼저 마지막 위치 값을 찾아낸다
        // delta 값은 지도의 크기를 정함, 값이 작을수록 확대되는 효과가 있음, delta를 0.01로 하면 1의 값보다 100배 확대해서 보여 줌
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address: String = country!
            
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }
    
    // 세그먼트 컨트롤을 선택하였을 때 호출
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 { // "현재 위치" 선택 - 현재 위치 표시
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 { // "홍익대학교" 선택 - 핀을 설치하고 위치 정보 표시
            setAnnotation(latitudeValue: 37.55170896781128, longitudeValue: 126.92500728447493, delta: 1, title: "홍익대학교 서울캠퍼스", subtitle: "서울특별시 마포구 상수동 와우산로 94")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "홍익대학교 서울캠퍼스"
        } else if sender.selectedSegmentIndex == 2 { // "이지스퍼블리싱" 선택 - 핀을 설치하고 위치 정보 표시
            setAnnotation(latitudeValue: 37.540542122683064, longitudeValue: 127.06931891331028, delta: 1, title: "건대입구역", subtitle: "서울특별시 화양동")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "건대입구역"
        }
    }
}

