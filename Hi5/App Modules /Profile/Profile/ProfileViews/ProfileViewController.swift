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
    func navigateToEditProfile()
    func hideIndecator()
}

class ProfileViewController: UIViewController {
	var interactor: IProfileInteractor?
	var router: IProfileRouter?
//MARK:- Outlets
    
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var editBtn: UIButton!
    
//MARK:- view LifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
        configer()
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
    }
    func navigateToEditProfile() {
        router?.navigateToEditProfile()
    }
    func hideIndecator() {
        activityIndicator.isHidden = true
    }
    func showResponse(data: ProfileModel.ShowProfileResponse) {
        guard let responseData = data.user else {
            return
        }
        let defaults = UserDefaults.standard
        let country = defaults.string(forKey: "country")
        if let data = defaults.object(forKey: "image") as? Data {
            let image = UIImage(data: data)
            profilePhoto.image = image
            
        }
        //self.countryName.text = country
        //let url = URL(fileURLWithPath: responseData.avatar!)
        self.countryName.text = responseData.country?.val
        self.fullName.text = responseData.name
        //self.profilePhoto.kf.setImage(with: url)
        self.userName.text = responseData.vieID
        self.descriptionLbl.text = responseData.biography
    }
}

extension ProfileViewController {
    func configer(){
        router = ProfileRouter(view: self)
    }
    func showIndecator() {
        activityIndicator.isHidden = false
    }
}
extension ProfileViewController {
    func loadShowProfileData() {
    interactor?.doShowProfile(view: self)
    }
}
