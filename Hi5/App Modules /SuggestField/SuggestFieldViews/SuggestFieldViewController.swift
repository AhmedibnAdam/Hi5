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
    let locationManager = CLLocationManager()
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtnTapped))
    }()
    
    @objc func backBtnTapped() {
        router?.navigateToTabBar()
    }
    //MARK: - Outlets
    @IBOutlet weak var MapView: GMSMapView!
    
    //MARK: - ViewLifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        MapView.isMyLocationEnabled = true
        MapView.delegate = self

        //Location Manager code to fetch current location
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        let camera = GMSCameraPosition.camera(withLatitude: (locationManager.location?.coordinate.latitude) ?? 23.8859, longitude: (locationManager.location?.coordinate.longitude) ?? 45.0792, zoom: 7)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: (locationManager.location?.coordinate.latitude) ?? 23.8859, longitude: (locationManager.location?.coordinate.longitude) ?? 45.0792)
        marker.map = mapView
        MapView.animate(to: camera)
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
        navigationController?.navigationBar.barTintColor = .systemOrange
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}

extension SuggestFieldViewController {
	func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
            MapView.isMyLocationEnabled = true
            MapView.settings.myLocationButton = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude:(location?.coordinate.longitude)!, zoom:14)
        MapView.animate(to: camera)
        //Finally stop updating location otherwise it will come again and again in this delegate
        self.locationManager.stopUpdatingLocation()

    }
}
