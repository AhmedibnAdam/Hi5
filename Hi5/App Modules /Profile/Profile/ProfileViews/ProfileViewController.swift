//
//  ProfileViewController.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import Kingfisher

protocol IProfileViewController: class {
    var router: IProfileRouter? { get set }
    func showAlert(title: String, msg: String)
    func showResponse(data: ProfileModel.ShowProfileResponse)
    func showPartnerResponse(data: ProfileModel.PartnerProfile)
    func showPlayerResponse(data: ProfileModel.PlayerShowProfile )
    func showFullPlayerResponse(data: ProfileModel.FullPlayerShowProfile )
    func navigateToEditProfile()
    func hideIndecator()
}

class ProfileViewController: UIViewController {
    var interactor: IProfileInteractor?
    var router: IProfileRouter?
    var dateOfBirth: String = ""
    var location: String = ""
    var id: Int?
    var type: String?
    var lat: Double?
    var long: Double?
    var response: ProfileModel.PartnerProfile?
    //MARK:- Outlets
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var topView: UIView!
//    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var editSports: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var address: UILabel!
    //    @IBOutlet weak var numOfFriends: UILabel!
//    @IBOutlet weak var friendsLbl: UILabel!
//    @IBOutlet weak var countryLogo: UIButton!
//    @IBOutlet weak var flag: UIButton!
//    @IBOutlet weak var countryNumber: UILabel!
//    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var imageprofileTop: NSLayoutConstraint!
    @IBOutlet weak var fieldTitleLbl: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var userProfileView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var imageprofileHight: NSLayoutConstraint!
    @IBOutlet weak var imgProfileWidth: NSLayoutConstraint!
    @IBOutlet weak var joinOn: UILabel!
    
    
    //MARK:- view LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configer()
        logoView.layer.cornerRadius = logoView.bounds.size.height / 2
    }
    override func viewWillAppear(_ animated: Bool) {
        showIndecator()
        loadShowProfileData()
    }
    //MARK:- Actions
    @IBAction func editBtnTapped(_ sender: UIButton) {
        navigateToEditProfile()
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        router?.navigateToTabBar()
        
    }
}

//MARK:- Extensions
extension ProfileViewController: IProfileViewController {
    
    
    
    
    func showAlert(title: String, msg: String) {
        ShowAlertView.showAlert(title: title, msg: msg, sender: self)
        indicator.stopAnimating()
    }
    func navigateToEditProfile() {
        router?.navigateToEditProfile()
    }
    func hideIndecator() {
        activityIndicator.isHidden = true
    }
    func showPartnerResponse(data: ProfileModel.PartnerProfile) {
        if data.partner != nil {
//            numOfFriends.isHidden = true
//            friendsLbl.isHidden = true
//            countryLogo.isHidden = true
//            countryNumber.isHidden = true
//            countryName.isHidden = true
//            flag.isHidden = true
            fieldTitleLbl.isHidden = false
        }
        guard let responseData = data.partner else {
            return
            
        }
        topView.isHidden = false
        indicator.stopAnimating()
        self.response = data
        phone.text = "Email: " + (response?.partner?.email ?? "")
        userName.text = response?.partner?.phone
        
        fullName.text = response?.partner?.name
        let url = URL(string: (response?.partner?.image)!)!
        profilePhoto.kf.setImage(with: url)
        tableView.reloadData()
    }
    func showResponse(data: ProfileModel.ShowProfileResponse) {
        guard let responseData = data.user else {
            return
            
        }
        topView.isHidden = false
        indicator.stopAnimating()
        fieldTitleLbl.isHidden = true
//        numOfFriends.isHidden = false
//        friendsLbl.isHidden = false
//        countryLogo.isHidden = false
//        countryNumber.isHidden = false
////        countryLbl.isHidden = false
//        countryName.isHidden = false
//        flag.isHidden = false
        let defaults = UserDefaults.standard
        if let img = responseData.avatar {
            let url = URL(string: img)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!) {
                    DispatchQueue.main.async {
                        self.profilePhoto.image = UIImage(data: data)
                        let images = UIImage(data: data)?.pngData()
                        UserDefaults().set(images, forKey: "image")
                    }
                }
            }
        }
        
//        self.countryName.text = responseData.country?.val
        self.phone.text = ""
        joinOn.text = " Joined on \(responseData.joined_at!) ."
        self.fullName.text = responseData.name
        self.userName.text = "@" + (responseData.vieID ?? "")
        self.descriptionLbl.text = responseData.biography
        if let gender = responseData.gender{
            defaults.set(gender, forKey: "Gender")
        }
        
        if let day = responseData.day?.val , let month = responseData.month?.val , let year = responseData.year?.val {
            dateOfBirth = day+" "+month+" "+year
            defaults.set(dateOfBirth, forKey: "DateOfBirth")
        }
        
        if let country = responseData.country?.val , let city = responseData.city?.val , let state = responseData.state?.val {
            location = country+" "+city+" "+state
            address.text = location
            defaults.set(location, forKey: "location")
            print(location)
        }
        
        if let fullName = responseData.name {
            //let name = fullName
            defaults.set(fullName, forKey: "FullName")
        }
        
        if let biography = responseData.biography {
            //let bio = biography
            defaults.set(biography, forKey: "biography")
        }
        
        if let yearFlag = responseData.year?.flag , let monthFlag = responseData.month?.flag , let dayFlag = responseData.day?.flag {
            defaults.set(yearFlag, forKey: "yearFlag")
            defaults.set(monthFlag, forKey: "monthFlag")
            defaults.set(dayFlag, forKey: "dayFlag")
        }
        
        if let countryFlag = responseData.country?.flag , let cityFlag = responseData.city?.flag , let stateFlag = responseData.state?.flag {
            defaults.set(countryFlag, forKey: "countryFlag")
            defaults.set(cityFlag, forKey: "cityFlag")
            defaults.set(stateFlag, forKey: "stateFlag")
        }
        
        
    }
    
    func showPlayerResponse(data: ProfileModel.PlayerShowProfile) {
        guard let responseData = data.user else {
            return
            
        }
        topView.isHidden = false
        indicator.stopAnimating()
        fieldTitleLbl.isHidden = true
//        numOfFriends.isHidden = false
//        friendsLbl.isHidden = false
//        countryLogo.isHidden = false
//        countryNumber.isHidden = false
//        countryName.isHidden = false
//        countryName.isHidden = false
//        flag.isHidden = false
        let defaults = UserDefaults.standard
        if let img = responseData.avatar {
            let url = URL(string: img)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!) {
                    DispatchQueue.main.async {
                        self.profilePhoto.image = UIImage(data: data)
                        let images = UIImage(data: data)?.pngData()
                    }
                }
            }
        }
        
        //        self.countryName.text = responseData.country?.val
        self.age.text = ", \(responseData.dateOfBirth ?? 0)"
        self.phone.text = ""
        self.fullName.text = responseData.name
        self.userName.text = responseData.vieID
        self.descriptionLbl.text = responseData.biography
    }
    
    func showFullPlayerResponse(data: ProfileModel.FullPlayerShowProfile) {
        guard let responseData = data.user else {
            return
            
        }
        topView.isHidden = false
        indicator.stopAnimating()
        fieldTitleLbl.isHidden = true
        //            numOfFriends.isHidden = false
        //            friendsLbl.isHidden = false
//        countryLogo.isHidden = false
//        //            countryNumber.isHidden = false
//        countryName.isHidden = false
        if let img = responseData.avatar {
            let url = URL(string: img)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url!) {
                    DispatchQueue.main.async {
                        self.profilePhoto.image = UIImage(data: data)
                    }
                }
            }
        }
        if let age =  responseData.dateOfBirth  {
           self.age.text = " , " + "\(age)"
        }
        else{
           self.age.text = ""
        }
        
//        self.countryName.isHidden = false
//        self.countryName.text = "\(responseData.country?.val ?? "" ), \(responseData.city?.val ?? "" ) . \(responseData.state?.val ?? "" )"
        self.phone.text = ""
        self.fullName.text = responseData.name
        self.userName.text = responseData.vieID
        self.descriptionLbl.text = responseData.biography
    }
    
}

extension ProfileViewController {
    func configer(){
        router = ProfileRouter(view: self)
        registerTableCell()
    }
    func showIndecator() {
        activityIndicator.isHidden = false
    }
}
extension ProfileViewController {
    func loadShowProfileData() {
        
        if id == nil || id == 0 {
            interactor?.showUsrerProfile()
            userProfileView.isHidden = false
            bottomView.isHidden = true
            editBtn.isHidden = false
        }
        else {
            imageprofileTop.constant = 50
            imageprofileHight.constant = 100
            imgProfileWidth.constant = 100
            logoView.layer.cornerRadius = 50

            editBtn.isHidden = true
            if type == "player"{
                interactor?.showPlyerProfile(id: id!)
            }
            else {
                userProfileView.isHidden = true
                interactor?.doShowProfile(id: id! , lat: lat ?? 0.0 , long: long ?? 0.0)
            }
        }
        
    }
}
extension ProfileViewController : UITableViewDelegate , UITableViewDataSource {
    func registerTableCell() {
        let cell = UINib(nibName: "FieldsTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "fieldsCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  response?.partner?.fields?.count ??  0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fieldsCell") as! FieldsTableViewCell
        //        cell.partner.isHidden =  true
        //        cell.companyImg.isHidden =  true
        cell.companyName.isHidden =  true
        cell.visabilityButton.isHidden = true
        
        let field = response?.partner?.fields?[indexPath.row]
        if let url = URL(string: (field?.fieldImage ?? "")){
            cell.fieldImg.kf.setImage(with: url)
        }
        
        cell.partner.text = field?.name
        cell.rateLbl.text = "\(field?.rating ?? 0)"
        cell.commentLbl.text = "\(field?.comments ?? 0)"
        cell.star.tag = indexPath.row
        cell.comment.tag = indexPath.row
        
        cell.locationLbl.text = field?.address
        cell.recomendedLbl.text = field?.recommendedFor
        cell.costLbl.text = "\(field?.cost ?? 0)"
        cell.paymentLbl.text = field?.payment
        cell.distance.text = field?.distance
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let field = self.response?.partner?.fields?[indexPath.row].id else {
            return
        }
        
        router?.navigateToShowdetails(param: ["longitude": self.long ?? 31.65465 , "latitude": self.lat ?? 29.75765 ] , field_id: "\(field)")
    }
}
