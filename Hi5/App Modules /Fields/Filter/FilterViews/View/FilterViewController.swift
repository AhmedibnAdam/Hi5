//
//  FilterViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import TTRangeSlider
import CoreLocation
import MapKit

protocol IFilterViewController: class {
	var router: IFilterRouter? { get set }
    func showAlert(title: String, msg: String)
    func showResponse(response: FilterModel.SuggestionFieldResponse)
    func hideIndicator()
}

class FilterViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , TTRangeSliderDelegate , CLLocationManagerDelegate {
    //MARK: - properties
	var interactor: IFilterInteractor?
	var router: IFilterRouter?
    var minRange: String = "10.0"
    var maxRange: String = "14.0"
    var sports: [FilterModel.Sport] = []
    var sportId = 11
    var nearByField: Bool?
    var lat: Double?
    var long: Double?
    var favourite: Bool?
    var memberOf: Bool?
    var gender: String?
    var fee: String?
    var bestFor: String?
    var param: [String: Any] = [:]
    var longitude: Double?
    var latitude: Double?
    let locationManager = CLLocationManager()
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtntapped))
    }()
    
    @objc func backBtntapped() {
        router?.navigateToFields()
    }
    //MARK: - Outlets
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var rangeSlider: TTRangeSlider!
    
    //MARK: - ViewLifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
        // Ask for Authorisation from the User.
        locationManager.requestAlwaysAuthorization()

        // For use in foreground
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        registerCollectionCell()
        rangeSlider.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        setupNavigationBar()
        initView()
        configer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showIndicator()
        interactor?.suggestionField(view: self)
    }
    //MARK: - Actions
    @IBAction func applyBtnTapped(_ sender: UIButton) {
        param["sport_type_id"] = sportId
        param["start_time"] = minRange
        param["end_time"] = maxRange
        print(param)
        router?.navigateToFilterResult(parameter: param)
        
    }
    @IBAction func nearByBtntapped(_ sender: UIButton) {
        if (sender.titleLabel?.textColor == UIColor.lightGray) {
            sender.setTitleColor(.orange, for: .normal)
            sender.borderColor = .orange
            self.nearByField = true
            self.lat = 31.276941
            self.long = 31.276941
            if let nearBy = nearByField , let lat = lat , let long = long {
                param["near_by_fields"] = nearBy
                param["latitude"] = lat
                param["longitude"] = long
            }
        } else {
            sender.setTitleColor(.lightGray, for: .normal)
            sender.borderColor = .lightGray
            self.nearByField = nil
            self.lat = nil
            self.long = nil
            param.removeValue(forKey: "near_by_fields")
            param.removeValue(forKey: "latitude")
            param.removeValue(forKey: "longitude")
        }
    }
    
    @IBAction func favouriteBtnTapped(_ sender: UIButton) {
        if (sender.titleLabel?.textColor == UIColor.lightGray) {
            sender.setTitleColor(.orange, for: .normal)
            sender.borderColor = .orange
            self.favourite = true
            if let favourite = favourite {
                param["favourite"] = favourite
            }
        } else {
            sender.setTitleColor(.lightGray, for: .normal)
            sender.borderColor = .lightGray
            self.favourite = nil
            param.removeValue(forKey: "favourite")
        }
    }
    
    @IBAction func memberOfBtnTapped(_ sender: UIButton) {
        if (sender.titleLabel?.textColor == UIColor.lightGray) {
            sender.setTitleColor(.orange, for: .normal)
            sender.borderColor = .orange
            self.memberOf = true
            if let memberOf = memberOf {
                param["member_of"] = memberOf
            }
        } else {
            sender.setTitleColor(.lightGray, for: .normal)
            sender.borderColor = .lightGray
            self.memberOf = nil
            param.removeValue(forKey: "member_of")
        }
    }
    
    @IBAction func maleBtnTapped(_ sender: UIButton) {
        if (sender.titleLabel?.textColor == UIColor.lightGray) {
            sender.setTitleColor(.orange, for: .normal)
            sender.borderColor = .orange
            self.gender = "male"
            if let gender = gender {
               param["gender"] = gender
            }
        } else {
            sender.setTitleColor(.lightGray, for: .normal)
            sender.borderColor = .lightGray
            self.gender = nil
            param.removeValue(forKey: "gender")
        }
    }
    
    @IBAction func femaleBtnTapped(_ sender: UIButton) {
        if (sender.titleLabel?.textColor == UIColor.lightGray) {
            sender.setTitleColor(.orange, for: .normal)
            sender.borderColor = .orange
            self.gender = "female"
            if let gender = gender {
               param["gender"] = gender
            }
        } else {
            sender.setTitleColor(.lightGray, for: .normal)
            sender.borderColor = .lightGray
            self.gender = nil
            param.removeValue(forKey: "gender")
        }
    }
    
    @IBAction func freeBtnTapped(_ sender: UIButton) {
        if (sender.titleLabel?.textColor == UIColor.lightGray) {
            sender.setTitleColor(.orange, for: .normal)
            sender.borderColor = .orange
            self.fee = "free"
            if let fee = fee {
               param["fee"] = fee
            }
        } else {
            sender.setTitleColor(.lightGray, for: .normal)
            sender.borderColor = .lightGray
            self.fee = nil
            param.removeValue(forKey: "fee")
        }
    }
    
    @IBAction func paidBtnTapped(_ sender: UIButton) {
        if (sender.titleLabel?.textColor == UIColor.lightGray) {
            sender.setTitleColor(.orange, for: .normal)
            sender.borderColor = .orange
            self.fee = "paid"
            if let fee = fee {
               param["fee"] = fee
            }
        } else {
            sender.setTitleColor(.lightGray, for: .normal)
            sender.borderColor = .lightGray
            self.fee = nil
            param.removeValue(forKey: "fee")
        }
    }
    
}

//MARK: - Extensions
extension FilterViewController: IFilterViewController {
    func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    func showResponse(response: FilterModel.SuggestionFieldResponse) {
        guard let resp = response.data?.sports else {return}
        self.sports = resp
        self.collectionView.reloadData()
    }
    func hideIndicator() {
        indicator.isHidden = true
    }

}

//MARK: - Extension
extension FilterViewController {
    func setupNavigationBar() {
        navigationItem.title = "Filter"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    func initView(){

    }

    func configer(){
       router = FilterRouter(view: self)
    }
    
    func showIndicator() {
        indicator.isHidden = false
    }

}

//MARK: - CollectionView
extension FilterViewController {
    func registerCollectionCell() {
            let cell = UINib(nibName: "SelectSportCell", bundle: nil)
            collectionView.register(cell, forCellWithReuseIdentifier: "SelectSportCell")
    }
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectSportCell", for: indexPath) as! SelectSportCell
        let sport = sports[indexPath.row]
        cell.sportNameLbl.text = sport.name
        if let sportImg = sport.icon {
            let url = URL(string: sportImg)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!){
                    DispatchQueue.main.async {
                        cell.sportImg.image = UIImage(data: data)
                    }
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SelectSportCell
        cell.isSelected = true
        let sport = sports[indexPath.row]
        self.sportId = sport.id ?? 11
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? SelectSportCell
        cell?.isSelected = false
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width / 4
            let height = collectionView.frame.height
            return CGSize(width: width, height: height)
    }
}

extension FilterViewController {
    func rangeSlider(_ sender: TTRangeSlider!, didChangeSelectedMinimumValue selectedMinimum: Float, andMaximumValue selectedMaximum: Float) {
        self.minRange = String(selectedMinimum)
        self.maxRange = String(selectedMaximum)
        print(minRange)
        print(maxRange)
    }
}

extension FilterViewController {
    // MARK: - CoreLocation Delegate Methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        self.latitude = locValue.latitude
        self.longitude = locValue.longitude
    }
}

//MARK: - Extension UIButton
@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
