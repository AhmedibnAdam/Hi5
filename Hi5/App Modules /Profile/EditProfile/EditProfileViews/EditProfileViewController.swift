//
//  EditProfileViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/20/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IEditProfileViewController: class {
	var router: IEditProfileRouter? { get set }
    func showAlert(title: String, msg: String)
}

class EditProfileViewController: UIViewController {
	var interactor: IEditProfileInteractor?
	var router: IEditProfileRouter?
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(dismissView))
    }()
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
//MARK:- Outlets
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var biographyContainerView: UIView!
    @IBOutlet weak var fullnameContainerView: UIView!
    @IBOutlet weak var locationContainerView: UIView!
    @IBOutlet weak var dateOfBirthContainerView: UIView!
    @IBOutlet weak var genderContainerView: UIView!
    @IBOutlet weak var saveBtn: UIButton!
    
//MARK:- View Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        initView()
        configure()
    }
//MARK:- Actions
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        saveBtnAction()
    }
    
    @IBAction func editPhotoBtnTapped(_ sender: UIButton) {
        editPhotoBtnAction()
    }
    
    @IBAction func locationBtnTapped(_ sender: UIButton) {
        locationBtnAction()
    }
    
    @IBAction func dateOfBirthBtnTapped(_ sender: UIButton) {
        dateOfBirthBtnAction()
    }
    
    @IBAction func genderBtnTapped(_ sender: UIButton) {
        genderBtnAction()
    }
}
//MARK:- Extensions
extension EditProfileViewController: IEditProfileViewController {
    func showAlert(title: String, msg: String) {
     ShowAlertView.showAlert(title: title, msg: msg, sender: self)
   }
}

extension EditProfileViewController {
    func setupNavigationBar() {
        navigationItem.title = "Edit Profile"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}

extension EditProfileViewController {
    func initView() {
        self.photoView = CreateCornerRauis.viewRaduis(view: self.photoView, number: (self.photoView.frame.size.height / 2))
        self.biographyContainerView = CreateCornerRauis.viewRaduis(view: self.biographyContainerView, number: 5)
        self.fullnameContainerView = CreateCornerRauis.viewRaduis(view: self.fullnameContainerView, number: 5)
        self.locationContainerView = CreateCornerRauis.viewRaduis(view: self.locationContainerView, number: 5)
        self.dateOfBirthContainerView = CreateCornerRauis.viewRaduis(view: self.dateOfBirthContainerView, number: 5)
        self.genderContainerView = CreateCornerRauis.viewRaduis(view: self.genderContainerView, number: 5)
          // MARK : - Button  raduis
        self.saveBtn = CreateCornerRauis.ButtonRaduis(button: self.saveBtn, number: 5)
    }
    
    func configure() {
        router = EditProfileRouter(view: self)
    }
}

extension EditProfileViewController {
     func saveBtnAction() {
        
    }
    
    func editPhotoBtnAction() {
        
    }
    
    func locationBtnAction() {
        
    }
    
    func dateOfBirthBtnAction() {
        router?.navigateToDateOfBirth()
    }
    
    func genderBtnAction() {
        router?.navigateToGender()
    }
}
