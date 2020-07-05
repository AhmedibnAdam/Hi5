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
import Contacts

protocol ISuggestFieldViewController: class {
	var router: ISuggestFieldRouter? { get set }
    func showAlert(title: String, msg: String)
}

class SuggestFieldViewController: UIViewController , CLLocationManagerDelegate , GMSMapViewDelegate{
	var interactor: ISuggestFieldInteractor?
	var router: ISuggestFieldRouter?
    
    //MARK: - Properties
    var lat: Double = 23.8859
    var long: Double = 45.0792
    let locationManager = CLLocationManager()
    var centerMapCoordinate:CLLocationCoordinate2D!
    var marker:GMSMarker!
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtnTapped))
    }()
    
    @objc func backBtnTapped() {
        router?.navigateToTabBar()
    }
    //MARK: - Outlets
    @IBOutlet weak var addressContainerView: UIView!
    @IBOutlet weak var MapView: GMSMapView!
    @IBOutlet weak var addressLb: UILabel!
    
    //MARK: - ViewLifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        initView()
        MapView.isMyLocationEnabled = true
        MapView.delegate = self

        //Location Manager code to fetch current location
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        let camera = GMSCameraPosition.camera(withLatitude: (locationManager.location?.coordinate.latitude) ?? 23.8859, longitude: (locationManager.location?.coordinate.longitude) ?? 45.0792, zoom: 10)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: (locationManager.location?.coordinate.latitude) ?? 23.8859, longitude: (locationManager.location?.coordinate.longitude) ?? 45.0792)
        marker.map = mapView
        MapView.animate(to: camera)
        
        let location = CLLocation(latitude: 23.8859, longitude: 45.0792)
        CLGeocoder().reverseGeocodeLocation(locationManager.location ?? location, preferredLocale: nil) { (clPlacemark: [CLPlacemark]?, error: Error?) in
            guard let place = clPlacemark?.first else {
                print("No placemark from Apple: \(String(describing: error))")
                return
            }

            let postalAddressFormatter = CNPostalAddressFormatter()
            postalAddressFormatter.style = .mailingAddress
            var addressString: String?
            if let postalAddress = place.postalAddress {
                addressString = postalAddressFormatter.string(from: postalAddress)
                //print(addressString)
                self.addressLb.text = addressString
            }
        }
        
        self.lat = (locationManager.location?.coordinate.latitude) ?? 23.8859
        self.long = (locationManager.location?.coordinate.longitude) ?? 45.0792
        print(lat)
        print(long)
    }

    
    //MARK: - Actions
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        router?.navigateToSuggestFieldDetails(latitude: lat , longitude: long)
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
        navigationController?.navigationBar.barTintColor = .orange
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func initView() {
      
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
        //guard let loc: CLLocation = manager.location else { return }
        self.locationManager.stopUpdatingLocation()

    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        let latitude = mapView.camera.target.latitude
        self.lat = latitude
        let longitude = mapView.camera.target.longitude
        self.long = longitude
        let location = CLLocation(latitude: lat, longitude: long)
        centerMapCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.placeMarkerOnCenter(centerMapCoordinate:centerMapCoordinate)
        CLGeocoder().reverseGeocodeLocation(location, preferredLocale: nil) { (clPlacemark: [CLPlacemark]?, error: Error?) in
            guard let place = clPlacemark?.first else {
                print("No placemark from Apple: \(String(describing: error))")
                return
            }

            let postalAddressFormatter = CNPostalAddressFormatter()
            postalAddressFormatter.style = .mailingAddress
            var addressString: String?
            if let postalAddress = place.postalAddress {
                addressString = postalAddressFormatter.string(from: postalAddress)
                //print(addressString)
                self.addressLb.text = addressString
            }
        }
    }
    
    func placeMarkerOnCenter(centerMapCoordinate:CLLocationCoordinate2D) {
       if marker == nil {
            marker = GMSMarker()
        }
        
        marker.position = centerMapCoordinate
        marker.map = self.MapView
    }
}
