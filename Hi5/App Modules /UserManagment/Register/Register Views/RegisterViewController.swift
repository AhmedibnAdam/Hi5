//
//  RegisterViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IRegisterViewController: class {
	var router: IRegisterRouter? { get set }
    func showAlert(title: String, msg: String)
}

class RegisterViewController: UIViewController {
	var interactor: IRegisterInteractor?
	var router: IRegisterRouter?
    //MARK:- Outlets
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var fullNameView: UIView!
    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet weak var containerView4: UIView!
    @IBOutlet weak var containerView3: UIView!
    @IBOutlet weak var containerView2: UIView!
    @IBOutlet weak var containerView1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        configer()
    }
    //MARK:- Actions
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        signupAction()
        //router?.navigateToSignupPhoneVerification()
    }
    @IBAction func loginBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
//MARK:- extensions
extension RegisterViewController: IRegisterViewController {
    
    func showAlert(title: String, msg: String) {
        ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    
}

extension RegisterViewController {
    
    func initView(){
        // MARK : - view raduis
        self.logoView = CreateCornerRauis.viewRaduis(view: self.logoView, number: (self.logoView.frame.size.height / 2))
        self.containerView1 = CreateCornerRauis.viewRaduis(view: self.containerView1, number: (self.containerView1.frame.size.height / 2))
        self.containerView2 = CreateCornerRauis.viewRaduis(view: self.containerView2, number: (self.containerView2.frame.size.height / 2))
        self.containerView3 = CreateCornerRauis.viewRaduis(view: self.containerView3, number: (self.containerView3.frame.size.height / 2))
        self.containerView4 = CreateCornerRauis.viewRaduis(view: self.containerView4, number: (self.containerView4.frame.size.height / 2))
        self.fullNameView = CreateCornerRauis.viewRaduis(view: self.fullNameView, number: 5)
        self.phoneNumberView = CreateCornerRauis.viewRaduis(view: self.phoneNumberView, number: 5)
          // MARK : - Button  raduis
        self.continueBtn = CreateCornerRauis.ButtonRaduis(button: self.continueBtn, number: 5)
    }
    
    func configer(){
        router = RegisterRouter(view: self)
    }
}

extension RegisterViewController {
    func signupAction() {
        guard let fullName = fullNameTextField.text , let phoneNumber = phoneNumberTextField.text else {return}
         if(fullName.isEmpty || phoneNumber.isEmpty){
             self.fullNameView = CreateBorder.viewBorder(view: self.fullNameView, width: 1.0, color: UIColor.red.cgColor)
             self.phoneNumberView = CreateBorder.viewBorder(view: self.phoneNumberView, width: 1.0, color: UIColor.red.cgColor)
             return
         }
        interactor?.doSignup(view: self, fullName: fullName, phoneNumber: phoneNumber)
    }
}

