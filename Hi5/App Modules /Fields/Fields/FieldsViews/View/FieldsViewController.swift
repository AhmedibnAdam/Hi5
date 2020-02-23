//
//  FieldsViewController.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import CoreLocation
import Kingfisher

protocol IFieldsViewController: class {
	var router: IFieldsRouter? { get set }
    func showAlert(title: String, msg: String)
    func showResponse(response: FieldsModel.NearByfieldsResponse)
    func showDetailsResponse(response: FieldsModel.ShowDetailsResponse)
    func removeNoMemberFields()
    func showNoMemberOfFields()
    func removeNoFavouriteFields()
    func showNoFavouriteFields()
}

class FieldsViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    var nearByField = [FieldsModel.Field]()
    var showDetailsField: FieldsModel.Fields?
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!
    var types = ["Nearby Fields","Favourites","Member of"]
	var interactor: IFieldsInteractor?
	var router: IFieldsRouter?
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtntapped))
    }()
    
    @objc func backBtntapped() {
        router?.navigateToTabBar()
    }
    //MARK: - Outlets
    @IBOutlet weak var noFavouriteFieldsLbl: UILabel!
    @IBOutlet weak var noFavouriteFieldsImg: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - viewLifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
        self.interactor?.nearBy(view: self, lon: 31.276941, lat: 29.962696)
        initView()
        configer()
        getCurrentLocation()
        setupNavigationBar()
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        registerCollectionCell()
        registerTableCell()
    }
    
    func getCurrentLocation() {
        locManager.requestAlwaysAuthorization()

        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            //print(locManager.location)
            guard let currentLocation = locManager.location else {
                return
            }
            print(currentLocation.coordinate.latitude)
            print(currentLocation.coordinate.longitude)
        }
    }
}

//MARK: - Extensions
extension FieldsViewController: IFieldsViewController {
    func showDetailsResponse(response: FieldsModel.ShowDetailsResponse) {
        guard let field = response.field else {return}
        self.showDetailsField = field
    }
    
     func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    
    func showResponse(response: FieldsModel.NearByfieldsResponse){
        guard let field = response.fields else {return}
        self.nearByField = field
        self.tableView.reloadData()
    }
    
    func removeNoFavouriteFields() {
        noFavouriteFieldsImg.isHidden = true
        noFavouriteFieldsLbl.isHidden = true
    }
    
    func showNoFavouriteFields() {
        noFavouriteFieldsImg.isHidden = false
        noFavouriteFieldsLbl.isHidden = false
        noFavouriteFieldsLbl.text = "You don't have favourite fields"
    }
    
    func removeNoMemberFields() {
        noFavouriteFieldsImg.isHidden = true
        noFavouriteFieldsLbl.isHidden = true
    }
    
    func showNoMemberOfFields() {
        noFavouriteFieldsImg.isHidden = false
        noFavouriteFieldsLbl.isHidden = false
        noFavouriteFieldsLbl.text = "You have no fields where you would be a member or sent requests"
    }
}

//MARK: - topCollectionView
extension FieldsViewController {
        func registerCollectionCell() {
            let cell = UINib(nibName: "TypeCollectionViewCell", bundle: nil)
            collectionView.register(cell, forCellWithReuseIdentifier: "typeCell")
    }
    
	    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return types.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let type = types[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "typeCell", for: indexPath) as! TypeCollectionViewCell
            cell.typeLbl.text = type
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width / 3
            let height = collectionView.frame.height
            return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TypeCollectionViewCell
        cell.typeLbl.textColor = .lightGray
        cell.hightLightVieww.isHidden = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let cell = collectionView.cellForItem(at: indexPath) as! TypeCollectionViewCell
            cell.typeLbl.textColor = .orange
            cell.hightLightVieww.isHidden = false
        if (indexPath.row == 0) {
            alert()
        } else if (indexPath.row == 1){
            self.interactor?.favourite(view: self)
        } else if (indexPath.row == 2){
            self.interactor?.memberOf(view: self)
        }
    }
}

//MARK: - initializer
extension FieldsViewController {
    func initView(){

    }

    func configer(){
       router = FieldsRouter(view: self)
    }
    func setupNavigationBar() {
        navigationItem.title = "Fields"
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "searchIcon"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
        button.setTitle("session", for: .normal)
        button.sizeToFit()
        button.tintColor = .black
        let searchSessionBtn = UIBarButtonItem(customView: button)
        navigationItem.setRightBarButton(searchSessionBtn, animated: true)
        button.addTarget(self, action: #selector(searchSession), for: .touchUpInside)
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func searchSession() {
        
    }
    
    func alert() {
        let alert = UIAlertController(title: "Your location", message: "High five Players app would like to use your current loccation to search fields near you.Do you agree?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (x) in
            self.interactor?.nearBy(view: self, lon: 31.276941, lat: 29.962696)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (y) in
            self.removeNoFavouriteFields()
            self.removeNoMemberFields()
            //self.tableView.isHidden = true
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }

}

//MARK: - tableView
extension FieldsViewController: UITableViewDelegate , UITableViewDataSource {
    
    func registerTableCell() {
        let cell = UINib(nibName: "FieldsTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "fieldsCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nearByField.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fieldsCell") as! FieldsTableViewCell
        let nearFields = nearByField[indexPath.row]
        cell.namelbl.text = nearFields.name
        cell.locationLbl.text = nearFields.address
        cell.commentLbl.text = String(nearFields.comments ?? 0)
        cell.rateLbl.text = String(nearFields.rating ?? 0)
        cell.sportTypeLbl.text = nearFields.sportType
        cell.genderLbl.text = nearFields.gender
        cell.recomendedLbl.text = nearFields.recommendedFor
        cell.companyName.text = nearFields.partnerName
        cell.visibilitylbl.text = nearFields.visibility
        cell.fieldId = nearFields.id
        if let cost = nearFields.cost {
            cell.costLbl.text = "StartedFrom:$\(String(describing: cost))/hour"
        }
        if let payment = nearFields.payment {
            cell.paymentLbl.text = String(describing: payment)
        }
        
        if let partnerImg = nearFields.partnerImage {
            let url = URL(fileURLWithPath: partnerImg)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        cell.companyImg.image = UIImage(data: data)
                    }
                }
            }
        }
        
        if let image = nearFields.fieldImage {
            let url = URL(string: image)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!){
                    DispatchQueue.main.async {
                        cell.fieldImg.image = UIImage(data: data)
                    }
                }
            }
        }
        
        if (nearFields.favourite == true){
            cell.favouriteBtn.setImage(UIImage(named: "star"), for: .normal)
        } else {
            cell.favouriteBtn.setImage(UIImage(named: "nonstar"), for: .normal)
        }
        
        cell.delegate = self
        cell.showDetailsDelegate = self
        
        return cell
    }
}

extension FieldsViewController: FavouriteTableViewCellDelegate {
    func addFavouriteDidTap(_ button: UIButton, cell: UITableViewCell , id: Int) {
        self.interactor?.addFavourite(view: self, fieldId: id)
    }
    func removeFavouriteDidTap(_ button: UIButton, cell: UITableViewCell , id: Int) {
        self.interactor?.removeFavourite(view: self, fieldId: id)
    }
}

extension FieldsViewController: ShowDetailsTableViewCellDelegate {
    func showDetailsDidTap(_ button: UIButton, cell: UITableViewCell, id: Int) {
        print("\(id)..............")
        self.interactor?.showDetails(view: self, fieldId: id)
        print("b55555555555\(showDetailsField)")
        //router?.navigateToShowdetails()
    }
}


