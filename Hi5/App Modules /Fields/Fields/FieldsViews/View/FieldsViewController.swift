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
    func showFavorites(response: FieldsModel.FavoriteFieldsResponse)
    func showMemberFields(response: FieldsModel.MemberShipFieldsResponse)
    func removeNoMemberFields()
    func showNoMemberOfFields()
    func removeNoFavouriteFields()
    func showNoFavouriteFields()
}

class FieldsViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    var nearByField = [FieldsModel.NearByfieldsResponseField]()
    var favoriteFields = [FieldsModel.FavoriteField]()
    var memberOfFields = [FieldsModel.MemberShipField]()
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    var types = ["Nearby","Favourites","Member of"]
    var interactor: IFieldsInteractor?
    var router: IFieldsRouter?
    var lat: Double?
    var long: Double?
    var fieldsCount = 0
    var fieldsTabType = 0  // nearBy = 0 / favorite = 1 / member of = 2
    var firstTimeIn = 0
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
        initView()
        //configer()
        
        setupNavigationBar()
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        registerCollectionCell()
        registerTableCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCurrentLocation()
          alert()
        
    }
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
}

//MARK: - Extensions
extension FieldsViewController: IFieldsViewController {
    
    func checkCount(){
        if self.fieldsCount != 0 {
            showTableView()
        }
        else{
            hideTableView()
        }
    }
    func showTableView(){
        tableView.isHidden = false
    }
    func hideTableView(){
        tableView.isHidden = true
    }
    
    func showAlert(title: String, msg: String) {
        ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    
    func showResponse(response: FieldsModel.NearByfieldsResponse){
        guard let field = response.fields else {return}
        self.nearByField = field
        self.fieldsCount = field.count
        checkCount()
        fieldsTabType = 0
        self.tableView.reloadData()
    }
    
    func showFavorites(response: FieldsModel.FavoriteFieldsResponse) {
        guard let fields = response.fields else {return}
        self.favoriteFields = fields
        self.fieldsCount = fields.count
        checkCount()
        fieldsTabType = 1
        self.tableView.reloadData()
    }
    func showMemberFields(response: FieldsModel.MemberShipFieldsResponse) {
        guard let fields = response.fields else {return}
        self.memberOfFields = fields
        self.fieldsCount = fields.count
        checkCount()
        fieldsTabType = 2
        self.tableView.reloadData()
    }
    
    func removeNoFavouriteFields() {
//        noFavouriteFieldsImg.isHidden = true
//        noFavouriteFieldsLbl.isHidden = true
    }
    
    func showNoFavouriteFields() {
        tableView.reloadData()
        noFavouriteFieldsLbl.text = "You don't have favourite fields"
    }
    
    func removeNoMemberFields() {
//        noFavouriteFieldsImg.isHidden = true
//        noFavouriteFieldsLbl.isHidden = true
    }
    
    func showNoMemberOfFields() {
//        noFavouriteFieldsImg.isHidden = false
//        noFavouriteFieldsLbl.isHidden = false
//        noFavouriteFieldsLbl.text = "You have no fields where you would be a member or sent requests"
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
        if firstTimeIn ==  0 {
            if indexPath.row == 0{
                cell.typeLbl.textColor = .orange
                cell.hightLightVieww.isHidden = false
                firstTimeIn += 1
            }
        }
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
        
        let firstCellIndexPath = IndexPath(item: 0, section: 0)
        let firstCell = collectionView.cellForItem(at: firstCellIndexPath) as!TypeCollectionViewCell
        firstCell.typeLbl.textColor = .lightGray
        firstCell.hightLightVieww.isHidden = true
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
extension FieldsViewController: CLLocationManagerDelegate {
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
        router?.navigateToFilter()
    }
    
    func alert() {
        let alert = UIAlertController(title: "Your location", message: "High five Players app would like to use your current loccation to search fields near you.Do you agree?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (x) in
            self.interactor?.nearBy(view: self, lon: self.long ?? 31.45445, lat: self.lat ?? 29.54646)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (y) in
        //    self.removeNoFavouriteFields()
            self.removeNoMemberFields()
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    // Print out the location to the console
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            //print(location.coordinate.latitude)
            self.lat = location.coordinate.latitude
            self.long = location.coordinate.longitude
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
    
    
}

//MARK: - tableView
extension FieldsViewController: UITableViewDelegate , UITableViewDataSource {
    func registerTableCell() {
        let cell = UINib(nibName: "FieldsTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "fieldsCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  fieldsCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fieldsCell") as! FieldsTableViewCell
        cell.delegate = self
        if self.fieldsTabType == 0 {
            let nearFields = nearByField[indexPath.row]
            cell.namelbl.text = nearFields.name
            cell.locationLbl.text = nearFields.address
            cell.commentLbl.text = String(nearFields.comments ?? 0)
            cell.rateLbl.text = String(nearFields.rating ?? 0)
            //        cell.sportTypeLbl.text = nearFields.sportType
            //        cell.genderLbl.text = nearFields.gender
            cell.recomendedLbl.text = nearFields.recommendedFor
            cell.companyName.text = nearFields.partnerName
            cell.partner.text = nearFields.name
            if nearFields.visibility == "public" {
                cell.visabilityButton.isHidden = true
            }else{
                cell.visabilityButton.isHidden = false
            }
            cell.fieldId = nearFields.id
            cell.field = nearFields
            if let cost = nearFields.cost {
                cell.costLbl.text = "\(String(describing: cost))"
            }
            if let payment = nearFields.payment {
                cell.paymentLbl.text = String(describing: payment)
            }
            
            if let partnerImg = nearFields.partnerImage {
                let url = URL(string: partnerImg)
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url!) {
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
                cell.favouriteBtn.setImage(UIImage(named: "favFill"), for: .normal)
            } else {
                cell.favouriteBtn.setImage(UIImage(named: "fav"), for: .normal)
            }
        }
        else if self.fieldsTabType == 1 {
            let favorFields = favoriteFields[indexPath.row]
            cell.namelbl.text = favorFields.name
             cell.partner.text = favorFields.name
            cell.locationLbl.text = favorFields.address
            cell.commentLbl.text = String(favorFields.comments ?? 0)
            cell.rateLbl.text = String(favorFields.rating ?? 0)
            //        cell.sportTypeLbl.text = nearFields.sportType
            //        cell.genderLbl.text = nearFields.gender
            cell.recomendedLbl.text = favorFields.recommendedFor
            cell.companyName.text = favorFields.partnerName
            if favorFields.visibility == "public" {
                cell.visabilityButton.isHidden = true
            }else{
                cell.visabilityButton.isHidden = false
            }
            cell.fieldId = favorFields.id
            cell.favouriteBtn.setImage(UIImage(named: "favFill"), for: .normal)
            //            cell.field = favorFields
            if let cost = favorFields.cost {
                cell.costLbl.text = "\(String(describing: cost))"
            }
            if let payment = favorFields.payment {
                cell.paymentLbl.text = String(describing: payment)
            }
            
            if let partnerImg = favorFields.partnerImage {
                let url = URL(string: partnerImg)
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url!) {
                        DispatchQueue.main.async {
                            cell.companyImg.image = UIImage(data: data)
                        }
                    }
                }
            }
            if let image = favorFields.fieldImage {
                let url = URL(string: image)
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url!){
                        DispatchQueue.main.async {
                            cell.fieldImg.image = UIImage(data: data)
                        }
                    }
                }
            }
        }
        else {
            let memberFields = memberOfFields[indexPath.row]
            cell.namelbl.text = memberFields.name
            cell.partner.text = memberFields.name
            cell.locationLbl.text = memberFields.address
            cell.commentLbl.text = String(memberFields.comments ?? 0)
            cell.rateLbl.text = String(memberFields.rating ?? 0)
            //        cell.sportTypeLbl.text = nearFields.sportType
            //        cell.genderLbl.text = nearFields.gender
            cell.recomendedLbl.text = memberFields.recommendedFor
            cell.companyName.text = memberFields.partnerName
            cell.visabilityButton.isHidden = false
            cell.fieldId = memberFields.id
            if (memberFields.favourite == true){
                cell.favouriteBtn.setImage(UIImage(named: "favFill"), for: .normal)
            } else {
                cell.favouriteBtn.setImage(UIImage(named: "fav"), for: .normal)
            }
            if let cost = memberFields.cost {
                cell.costLbl.text = "\(String(describing: cost))"
            }
            if let payment = memberFields.payment {
                cell.paymentLbl.text = String(describing: payment)
            }
            
            if let partnerImg = memberFields.partnerImage {
                let url = URL(string: partnerImg)
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url!) {
                        DispatchQueue.main.async {
                            cell.companyImg.image = UIImage(data: data)
                        }
                    }
                }
            }
            if let image = memberFields.fieldImage {
                let url = URL(string: image)
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url!){
                        DispatchQueue.main.async {
                            cell.fieldImg.image = UIImage(data: data)
                        }
                    }
                }
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        print("\(field.id!)..........")
        if self.fieldsTabType == 0 {
            let nearFields = nearByField[indexPath.row]
            router?.navigateToShowdetails(field_id: "\(nearFields.id!)")
        }
        else  if self.fieldsTabType == 1{
            let nearFields = favoriteFields[indexPath.row]
            router?.navigateToShowdetails(field_id: "\(nearFields.id!)")
        }
        else{
            let nearFields = memberOfFields[indexPath.row]
            router?.navigateToShowdetails(field_id: "\(nearFields.id!)")
        }
        
    }
}

extension FieldsViewController: FavouriteTableViewCellDelegate {
    func addFavouriteDidTap(_ button: UIButton, cell: UITableViewCell , id: Int) {
        self.interactor?.addFavourite(view: self, fieldId: id)
        
    }
    func removeFavouriteDidTap(_ button: UIButton, cell: UITableViewCell , id: Int) {
        self.interactor?.removeFavourite(view: self, fieldId: id)
        self.interactor?.favourite(view: self)
    }
}

extension FieldsViewController: ShowDetailsTableViewCellDelegate {
    func showDetailsDidTap(_ button: UIButton, cell: UITableViewCell, field: FieldsModel.NearByfieldsResponseField) {
        print("\(field.id!)..........")
        router?.navigateToShowdetails(field_id: "\(field.id ?? 0)")
    }
}


