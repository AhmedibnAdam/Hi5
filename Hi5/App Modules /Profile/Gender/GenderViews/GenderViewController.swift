//
//  GenderViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/21/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IGenderViewController: class {
	var router: IGenderRouter? { get set }
    func showAlert(title: String, msg: String)
}

//protocol GenderEnteredDelegate: class {
//    func userDidEnterGender(gender: String)
//}

class GenderViewController: UIViewController {
	var interactor: IGenderInteractor?
	var router: IGenderRouter?
    var gender: String?
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(dismissView))
    }()
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK:- Outlets
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var notSpecifiedBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    //weak var delegate: GenderEnteredDelegate?
    

    //MARK:- View Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        initView()
        configer()
    }
    //MARK:- Actions
    @IBAction func maleBtnTapped(_ sender: UIButton) {
        self.maleBtn = CreateBorder.buttonBorder(button: self.maleBtn, width: 1.0, color: UIColor.orange.cgColor)
        self.maleBtn.setTitleColor(UIColor .orange, for: UIControl.State.normal)
        self.maleBtn.tintColor = .orange
        self.gender = maleBtn.titleLabel?.text
        
        self.femaleBtn = CreateBorder.buttonBorder(button: self.femaleBtn, width: 1.0, color: UIColor.lightGray.cgColor)
        self.femaleBtn.setTitleColor(UIColor .lightGray, for: UIControl.State.normal)
        self.femaleBtn.tintColor = .lightGray
        
        self.notSpecifiedBtn = CreateBorder.buttonBorder(button: self.notSpecifiedBtn, width: 1.0, color: UIColor.lightGray.cgColor)
        self.notSpecifiedBtn.setTitleColor(UIColor .lightGray, for: UIControl.State.normal)
        self.notSpecifiedBtn.tintColor = .lightGray
    }
    
    @IBAction func femaleBtnTapped(_ sender: UIButton) {
        self.femaleBtn = CreateBorder.buttonBorder(button: self.femaleBtn, width: 1.0, color: UIColor.orange.cgColor)
        self.femaleBtn.setTitleColor(UIColor .orange, for: UIControl.State.normal)
        self.femaleBtn.tintColor = .orange
        self.gender = femaleBtn.titleLabel?.text
        
        self.maleBtn = CreateBorder.buttonBorder(button: self.maleBtn, width: 1.0, color: UIColor.lightGray.cgColor)
        self.maleBtn.setTitleColor(UIColor .lightGray, for: UIControl.State.normal)
        self.maleBtn.tintColor = .lightGray
        
        self.notSpecifiedBtn = CreateBorder.buttonBorder(button: self.notSpecifiedBtn, width: 1.0, color: UIColor.lightGray.cgColor)
        self.notSpecifiedBtn.setTitleColor(UIColor .lightGray, for: UIControl.State.normal)
        self.notSpecifiedBtn.tintColor = .lightGray
    }
    
    @IBAction func notSpecifiedBtnTapped(_ sender: UIButton) {
        self.notSpecifiedBtn = CreateBorder.buttonBorder(button: self.notSpecifiedBtn, width: 1.0, color: UIColor.orange.cgColor)
        self.notSpecifiedBtn.setTitleColor(UIColor .orange, for: UIControl.State.normal)
        self.notSpecifiedBtn.tintColor = .orange
        self.gender = notSpecifiedBtn.titleLabel?.text
        
        self.maleBtn = CreateBorder.buttonBorder(button: self.maleBtn, width: 1.0, color: UIColor.lightGray.cgColor)
        self.maleBtn.setTitleColor(UIColor .lightGray, for: UIControl.State.normal)
        self.maleBtn.tintColor = .lightGray
        
        self.femaleBtn = CreateBorder.buttonBorder(button: self.femaleBtn, width: 1.0, color: UIColor.lightGray.cgColor)
        self.femaleBtn.setTitleColor(UIColor .lightGray, for: UIControl.State.normal)
        self.femaleBtn.tintColor = .lightGray
    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
//        guard let gender = gender else {return}
//        delegate?.userDidEnterGender(gender: gender)
//        let vc = EditProfileViewController()
//        vc.gender = gender
        guard let gender = gender else {return}
        router?.navigateToEditProfile(gender: gender)
    }
}

//MARK:- extensions
extension GenderViewController: IGenderViewController {
     func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
}

extension GenderViewController {
    func setupNavigationBar() {
        navigationItem.title = "Gender"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func initView(){
        // MARK : - Button  raduis
        self.saveBtn = CreateCornerRauis.ButtonRaduis(button: self.saveBtn, number: 5)
        self.maleBtn = CreateCornerRauis.ButtonRaduis(button: self.maleBtn, number: 5)
        self.femaleBtn = CreateCornerRauis.ButtonRaduis(button: self.femaleBtn, number: 5)
        self.notSpecifiedBtn = CreateCornerRauis.ButtonRaduis(button: self.notSpecifiedBtn, number: 5)
        // MARK : - images edge insets
        self.maleBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        self.femaleBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        self.notSpecifiedBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        self.maleBtn.tintColor = .lightGray
        // MARK : - Button Border
        self.maleBtn = CreateBorder.buttonBorder(button: self.maleBtn, width: 1.0, color: UIColor.lightGray.cgColor)
        self.femaleBtn = CreateBorder.buttonBorder(button: self.femaleBtn, width: 1.0, color: UIColor.lightGray.cgColor)
        self.notSpecifiedBtn = CreateBorder.buttonBorder(button: self.notSpecifiedBtn, width: 1.0, color: UIColor.lightGray.cgColor)
    }
    
    func configer(){
        router = GenderRouter(view: self)
    }
}

extension GenderViewController {

}
