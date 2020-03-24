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

class SuggestFieldViewController: UIViewController , CLLocationManagerDelegate {
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
        
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Your map initiation code
        print(lat)
        print(long)
        let camera = GMSCameraPosition.camera(withLatitude: lat ?? 24.774265, longitude: long ?? 46.738586, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.view = mapView
        self.MapView.isMyLocationEnabled = true
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat ?? 24.774265, longitude: long ?? 46.738586)
        marker.map = mapView
    }
    
    //MARK: - Actions
}


  //MARK: - Extensions
extension SuggestFieldViewController: ISuggestFieldViewController {
	func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
}

extension SuggestFieldViewController {
    func setupNavigationBar() {
        navigationItem.title = "Sugest Field"
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
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        self.lat = locValue.latitude
        self.long = locValue.longitude
        
        //let location = locations.last
        let camera = GMSCameraPosition.camera(withLatitude: locValue.latitude, longitude: locValue.longitude, zoom: 17.0)

        self.MapView.animate(to: camera)

        //Finally stop updating location otherwise it will come again and again in this delegate
        self.locationManager.stopUpdatingLocation()

    }
}
