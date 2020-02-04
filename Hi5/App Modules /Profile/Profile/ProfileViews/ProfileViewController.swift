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

protocol IProfileViewController: class {
	var router: IProfileRouter? { get set }
    func showAlert(title: String, msg: String)
    func navigateToEditProfile()
    func hideIndecator()
}

class ProfileViewController: UIViewController {
	var interactor: IProfileInteractor?
	var router: IProfileRouter?
//MARK:- Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var editBtn: UIButton!
    
//MARK:- view LifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
        initView()
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
    
    @IBAction func sideMenuBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func threeDotMenuTapped(_ sender: UIButton) {
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
}

extension ProfileViewController {
    func initView(){
         //MARK : - view raduis
//        self.logoView = CreateCornerRauis.viewRaduis(view: self.logoView, number: (self.logoView.frame.size.height / 2))
//        self.profileImage = CreateCornerRauis.imageViewRaduis(view: profileImage, number: (self.profileImage.frame.size.height / 2))
    }
    
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
