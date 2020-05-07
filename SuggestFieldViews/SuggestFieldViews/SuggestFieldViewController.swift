//
//  SuggestFieldViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/24/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation
import MapKit

protocol ISuggestFieldViewController: class {
    var router: ISuggestFieldRouter? { get set }
    func showAlert(title: String, msg: String)
}

class SuggestFieldViewController: UIViewController , CLLocationManagerDelegate , GMSMapViewDelegate{
    var interactor: ISuggestFieldInteractor?
    var router: ISuggestFieldRouter?
    
    //MARK: - Properties
    var lat: Double?
    var long: Double?
    var map_view_is_idle = true
    var isPickUpTapped: Bool = false
    let locationManager = CLLocationManager()
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtnTapped))
    }()
    
    @objc func backBtnTapped() {
        router?.navigateToTabBar()
    }
    //MARK: - Outlets
    @IBOutlet weak var MapView: GMSMapView!
    @IBOutlet var viewPin: UIButton!
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        MapView.isMyLocationEnabled = true
        MapView.delegate = self
        
        //Location Manager code to fetch current location
        
        let camera = GMSCameraPosition.camera(withLatitude: (locationManager.location?.coordinate.latitude) ?? 23.8859, longitude: (locationManager.location?.coordinate.longitude) ?? 45.0792, zoom: 7)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        MapView.animate(to: camera)
        MapView = mapView
        getCurrentLocation()
        viewPin.center = MapView.center
        
        //self.view = mapView
    }
    
    //MARK: - Actions
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        print("save button tapped....")
    }
}


//MARK: - Extensions
extension SuggestFieldViewController: ISuggestFieldViewController {
    func showAlert(title: String, msg: String) {
        ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
}

extension SuggestFieldViewController {
    func setupNavigationBar() {
        navigationItem.title = "Suggest Field"
        let button = UIButton(type: .system)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
        button.sizeToFit()
        button.tintColor = .black
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}

extension SuggestFieldViewController {
    
    
    func getCurrentLocation() {
        locationManager.delegate = self
        
        // For use when the app is open
        locationManager.requestWhenInUseAuthorization()
        
        // If location services is enabled get the users location
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
        locationManager.startUpdatingLocation()
        
        var latitude: Double? {
            if let text = lat {
                return Double(text)
            } else {
                return nil
            }
        }
        
        var longitude: Double? {
            if let text = long {
                return Double(text)
            } else {
                return nil
            }
        }
    }
    // Print out the location to the console
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            //print(location.coordinate.latitude)
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            
            
            
        }
    }
    
    // If we have been deined access give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            print(status)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\(error.localizedDescription)")
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
        self.viewPin.transform = .identity
        // let coords = position.target
        let pickUpLatitude = position.target.latitude
        let pickUpLongitude = position.target.longitude
        print("\(pickUpLatitude) , \(pickUpLongitude)")
        
    }
    

}
