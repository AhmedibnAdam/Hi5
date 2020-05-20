//
//  FilterBublicEventViewController.swift
//  Hi5
//
//  Created by Adam on 5/19/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import TTRangeSlider
import CoreLocation
import MapKit

protocol IFilterBublicEventViewController: class {
	var router: IFilterBublicEventRouter? { get set }
    func showAlert(title: String, msg: String)
       func showResponse(response: FilterModel.SuggestionFieldResponse)
       func hideIndicator()
}

class FilterBublicEventViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , TTRangeSliderDelegate , CLLocationManagerDelegate {
	var interactor: IFilterBublicEventInteractor?
	var router: IFilterBublicEventRouter?
    
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
          router?.navigateToBublicEvent(parameters: param)
      }
    
    
    //MARK: - Outlets
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var rangeSlider: TTRangeSlider!
    
    
	override func viewDidLoad() {
        super.viewDidLoad()
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
               interactor?.filterEvent()
    }
    
    //MARK: - Actions
    @IBAction func applyBtnTapped(_ sender: UIButton) {
//        param["sport_type"] = sportId
        param["start_time"] = minRange
        param["end_time"] = maxRange
        param["name"] = "All Stadiums"
        print(param)
        router?.navigateToBublicEvent(parameters: param)
        
    }
    @IBAction func nearByBtntapped(_ sender: UIButton) {
        if (sender.titleLabel?.textColor == UIColor.lightGray) {
            sender.setTitleColor(.orange, for: .normal)
            sender.borderColor = .orange
            self.nearByField = true
           
            if let nearBy = nearByField , let lat = self.latitude , let long = longitude {
                param["near_by"] = nearBy
                param["latitude"] = lat
                param["longitude"] = long
            }
            else{
                let nearBy = nearByField 
                self.lat = 29.95476
                self.long = 31.276941
                param["near_by"] = nearBy
                param["latitude"] = lat
                param["longitude"] = long
            }
        } else {
           
            sender.setTitleColor(.lightGray, for: .normal)
            sender.borderColor = .lightGray
            self.nearByField = nil
            param["latitude"] = lat
            param["longitude"] = long
            param.removeValue(forKey: "near_by")
            
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
    
    @IBAction func matchBtnTapped(_ sender: UIButton) {
        if (sender.titleLabel?.textColor == UIColor.lightGray) {
            sender.setTitleColor(.orange, for: .normal)
            sender.borderColor = .orange
            self.gender = "matching"
            if let gender = gender {
               param["matching"] = gender
            }
        } else {
            sender.setTitleColor(.lightGray, for: .normal)
            sender.borderColor = .lightGray
            self.gender = nil
            param.removeValue(forKey: "matching")
        }
    }
    
    @IBAction func AllBtnTapped(_ sender: UIButton) {
        if (sender.titleLabel?.textColor == UIColor.lightGray) {
            sender.setTitleColor(.orange, for: .normal)
            sender.borderColor = .orange
            self.gender = "All"
            if let gender = gender {
               param["matching"] = gender
            }
        } else {
            sender.setTitleColor(.lightGray, for: .normal)
            sender.borderColor = .lightGray
            self.gender = nil
            param.removeValue(forKey: "All")
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

extension FilterBublicEventViewController: IFilterBublicEventViewController {
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

extension FilterBublicEventViewController {
    func setupNavigationBar() {
        navigationItem.title = "Filter"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    func initView(){

    }

    func configer(){
//       router = FilterRouter(view: self)
    }
    
    func showIndicator() {
        indicator.isHidden = false
    }

}

extension FilterBublicEventViewController {
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

extension FilterBublicEventViewController {
    func rangeSlider(_ sender: TTRangeSlider!, didChangeSelectedMinimumValue selectedMinimum: Float, andMaximumValue selectedMaximum: Float) {
        self.minRange = String(Int(selectedMinimum)) + ".0"
        self.maxRange = String(Int(selectedMaximum)) + ".0"
        print(minRange)
        print(maxRange)
    }
}
extension FilterBublicEventViewController {
    // MARK: - CoreLocation Delegate Methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        self.latitude = locValue.latitude
        self.longitude = locValue.longitude
    }
}

