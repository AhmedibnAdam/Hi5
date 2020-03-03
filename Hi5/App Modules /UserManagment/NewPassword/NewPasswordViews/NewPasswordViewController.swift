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
    func hideIndicator()
}

class NewPasswordViewController: UIViewController, UITextFieldDelegate {
	var interactor: INewPasswordInteractor?
	var router: INewPasswordRouter?
    //MARK:- Outlets
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
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
        showIndicator()
        
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
    func hideIndicator() {
        loadingIndicator.isHidden = true
    }
}

extension NewPasswordViewController {
    func configer(){
        router = NewPasswordRouter(view: self)
    }
    
    func showIndicator() {
        loadingIndicator.isHidden = false
    }

}

extension NewPasswordViewController {
    func getStartedAction() {
        guard let password = newPasswordTextField.text , let confirmPassword = confirmPasswordTextField.text else {return}
        if(password.isEmpty || confirmPassword.isEmpty){
            newPasswordView.viewBorderWidth = 1.0
            newPasswordView.viewBorderColor = UIColor.red
            confirmPasswordView.viewBorderWidth = 1.0
            confirmPasswordView.viewBorderColor = UIColor.red
            return
        } else if(password != confirmPassword) {
            showAlert(title: "Error", msg: "Confirm Password Do Not Match Password")
        }
        showIndicator()
//        interactor?.doCreatePassword(view: self, password: password, confirmPassword: confirmPassword)
    }
}

