//
//  NewPasswordViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol INewPasswordViewController: class {
	var router: INewPasswordRouter? { get set }
    func showAlert(title: String, msg: String)
}

class NewPasswordViewController: UIViewController, UITextFieldDelegate {
	var interactor: INewPasswordInteractor?
	var router: INewPasswordRouter?
    //MARK:- Outlets
    
    @IBOutlet weak var confirmPasswordBtnEye: UIButton!
    @IBOutlet weak var passwordBtnEye: UIButton!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var getStartedBtn: UIButton!
    @IBOutlet weak var newPasswordView: UIView!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newPasswordTextField.delegate = self
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
    //MARK: - Actions
    @IBAction func passwordBtnEyeTapped(_ sender: UIButton) {
        if sender.currentImage == UIImage(named:"eyeLocked") {
           sender.setImage(UIImage(named:"eye"), for: .normal)
            self.newPasswordTextField.isSecureTextEntry = false
         }
        else if sender.currentImage == UIImage(named:"eye") {
            sender.setImage( UIImage(named:"eyeLocked"), for: .normal)
            self.newPasswordTextField.isSecureTextEntry = true
        }
    }
    
    @IBAction func confirmPasswordBtnEyeTapped(_ sender: UIButton) {
        if sender.currentImage == UIImage(named:"eyeLocked") {
           sender.setImage(UIImage(named:"eye"), for: .normal)
            self.confirmPasswordTextField.isSecureTextEntry = false
         }
        else if sender.currentImage == UIImage(named:"eye") {
            sender.setImage( UIImage(named:"eyeLocked"), for: .normal)
            self.confirmPasswordTextField.isSecureTextEntry = true
        }
    }
    
    @IBAction func getStartedBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        router?.navigateToLogin()
    }
}
//MARK:- extensions
extension NewPasswordViewController: INewPasswordViewController {
    func showAlert(title: String, msg: String) {
         ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
}

extension NewPasswordViewController {
    func initView(){
        // MARK : - view raduis
        self.logoView = CreateCornerRauis.viewRaduis(view: self.logoView, number: (self.logoView.frame.size.height / 2))
        self.newPasswordView = CreateCornerRauis.viewRaduis(view: self.newPasswordView, number: 5)
        self.confirmPasswordView = CreateCornerRauis.viewRaduis(view: self.confirmPasswordView, number: 5)
          // MARK : - Button  raduis
        self.getStartedBtn = CreateCornerRauis.ButtonRaduis(button: self.getStartedBtn, number: 5)
    }
    
    func configer(){
        router = NewPasswordRouter(view: self)
    }
}

extension NewPasswordViewController {
    func getStartedAction() {
        guard let password = newPasswordTextField.text , let confirmPassword = confirmPasswordTextField.text else {return}
        if(password.isEmpty || confirmPassword.isEmpty){
            self.newPasswordView = CreateBorder.viewBorder(view: self.newPasswordView, width: 1.0, color: UIColor.red.cgColor)
            self.confirmPasswordView = CreateBorder.viewBorder(view: self.confirmPasswordView, width: 1.0, color: UIColor.red.cgColor)
            return
        } else if(password != confirmPassword) {
            showAlert(title: "Error", msg: "Confirm Password Do Not Match Password")
        }
//        interactor?.doCreatePassword(view: self, password: password, confirmPassword: confirmPassword)
    }
}

