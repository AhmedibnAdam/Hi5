//
//  CreatePasswordViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICreatePasswordViewController: class {
	var router: ICreatePasswordRouter? { get set }
    func showAlert(title: String, msg: String)
    func navigateToWelcome()
}

class CreatePasswordViewController: UIViewController, UITextFieldDelegate {
	var interactor: ICreatePasswordInteractor?
	var router: ICreatePasswordRouter?
    //MARK:- Outlets
    
    @IBOutlet weak var passwordEyebtn: UIButton!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var containerView2: UIView!
    @IBOutlet weak var getStartedBtn: UIButton!
    @IBOutlet weak var containerView4: UIView!
    @IBOutlet weak var containerView3: UIView!
    @IBOutlet weak var containerView1: UIView!
    @IBOutlet weak var logoView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordTextField.delegate = self
        self.confirmPasswordTextField.delegate = self
		initView()
        configer()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //MARK:- Actions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmPasswordEyeBtnTapped(_ sender: UIButton) {
        if sender.currentImage == UIImage(named:"eyeLocked") {
           sender.setImage(UIImage(named:"eye"), for: .normal)
            self.confirmPasswordTextField.isSecureTextEntry = false
         }
        else if sender.currentImage == UIImage(named:"eye") {
            sender.setImage( UIImage(named:"eyeLocked"), for: .normal)
            self.confirmPasswordTextField.isSecureTextEntry = true
        }
    }
    
    @IBAction func passwordEyeBtnTapped(_ sender: UIButton) {
        if sender.currentImage == UIImage(named:"eyeLocked") {
           sender.setImage(UIImage(named:"eye"), for: .normal)
            self.passwordTextField.isSecureTextEntry = false
         }
        else if sender.currentImage == UIImage(named:"eye") {
            sender.setImage( UIImage(named:"eyeLocked"), for: .normal)
            self.passwordTextField.isSecureTextEntry = true
        }
    }
    
    @IBAction func getStartedBtnTapped(_ sender: UIButton) {
        getStartedAction()
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        loginBtnAction()
    }
}

//MARK:- extensions
extension CreatePasswordViewController: ICreatePasswordViewController {
    func showAlert(title: String, msg: String) {
         ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    func navigateToWelcome() {
        router?.navigateToWelcome()
    }
}

extension CreatePasswordViewController {
    func initView(){
        // MARK : - view raduis
        self.passwordEyebtn.setImage(UIImage(named: "eyeLocked"), for: .normal)
        //self.confirmPasswordBtnTapped.setImage(UIImage(named: "eyelocked"), for: .normal)
        self.logoView = CreateCornerRauis.viewRaduis(view: self.logoView, number: (self.logoView.frame.size.height / 2))
        self.containerView1 = CreateCornerRauis.viewRaduis(view: self.containerView1, number: (self.containerView1.frame.size.height / 2))
        self.containerView2 = CreateCornerRauis.viewRaduis(view: self.containerView2, number: (self.containerView2.frame.size.height / 2))
        self.containerView3 = CreateCornerRauis.viewRaduis(view: self.containerView3, number: (self.containerView3.frame.size.height / 2))
        self.containerView4 = CreateCornerRauis.viewRaduis(view: self.containerView4, number: (self.containerView4.frame.size.height / 2))
          // MARK : - Button  raduis
        self.getStartedBtn = CreateCornerRauis.ButtonRaduis(button: self.getStartedBtn, number: 5)
    }
    
    func configer(){
        router = CreatePasswordRouter(view: self)
    }
}

extension CreatePasswordViewController {
    func getStartedAction() {
        guard let password = passwordTextField.text , let confirmPassword = confirmPasswordTextField.text else {return}
        if(password.isEmpty || confirmPassword.isEmpty){
            self.passwordView = CreateBorder.viewBorder(view: self.passwordView, width: 1.0, color: UIColor.red.cgColor)
            self.confirmPasswordView = CreateBorder.viewBorder(view: self.confirmPasswordView, width: 1.0, color: UIColor.red.cgColor)
            return
        } else if(password != confirmPassword) {
            showAlert(title: "Error", msg: "Confirm Password Do Not Match Password")
        }
        interactor?.doCreatePassword(view: self, password: password, confirmPassword: confirmPassword)
    }
    func loginBtnAction() {
        router?.navigateToLogin()
    }
}

