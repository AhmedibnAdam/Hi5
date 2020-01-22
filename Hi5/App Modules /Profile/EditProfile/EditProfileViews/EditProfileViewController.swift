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
import ActionSheetPicker_3_0

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
        ActionSheetMultipleStringPicker.show(withTitle: "Date Of Birth", rows: [
                   ["1", "2", "3","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"],
                   ["Jan", "Feb", "Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],
                   ["1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990", "1991", "1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023","2024","2025","2026","2027","2028","2029","2030"]
                   ], initialSelection: [5, 5, 5], doneBlock: {
                       picker, indexes, values in
                       print("values = \(values)")
                       return
               }, cancel: { ActionMultipleStringCancelBlock in return }, origin: sender)
        //dateOfBirthBtnAction()
        
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
