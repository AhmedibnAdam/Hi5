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
    func navigateToProfile()
    func hideIndicator()
}

class CreatePasswordViewController: UIViewController, UITextFieldDelegate {
	var interactor: ICreatePasswordInteractor?
	var router: ICreatePasswordRouter?
    //MARK:- Outlets
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
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
    
    //MARK:- View Life Cycle
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
        if self.confirmPasswordTextField.isSecureTextEntry {
                 sender.setImage(UIImage(named:"eye"), for: .normal)
                  self.confirmPasswordTextField.isSecureTextEntry = false
               }
              else {
                  sender.setImage( UIImage(named:"eyeLocked"), for: .normal)
                  self.confirmPasswordTextField.isSecureTextEntry = true
              }
    }
    
    @IBAction func passwordEyeBtnTapped(_ sender: UIButton) {
   
        if self.passwordTextField.isSecureTextEntry {
              sender.setImage(UIImage(named:"eye"), for: .normal)
               self.passwordTextField.isSecureTextEntry = false
            }
           else {
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
    func navigateToProfile() {
        router?.navigateToProfile()
    }
    func hideIndicator() {
        loadingIndicator.isHidden = true
    }
}

extension CreatePasswordViewController {
    func initView(){
        // MARK : - view raduis
        self.passwordEyebtn.setImage(UIImage(named: "eyeLocked"), for: .normal)
    }
    func configer(){
        router = CreatePasswordRouter(view: self)
    }
    
    func showIndicator() {
        loadingIndicator.isHidden = false
    }

}

extension CreatePasswordViewController {
    func getStartedAction() {
        guard let password = passwordTextField.text , let confirmPassword = confirmPasswordTextField.text else {return}
        if(password.isEmpty || confirmPassword.isEmpty){
            passwordView.viewBorderWidth = 1.0
            passwordView.viewBorderColor = UIColor.red
            confirmPasswordView.viewBorderWidth = 1.0
            confirmPasswordView.viewBorderColor = UIColor.red
            return
        } else if(password != confirmPassword) {
            showAlert(title: "Error", msg: "Confirm Password Do Not Match Password")
        }
        showIndicator()
        interactor?.doCreatePassword(view: self, password: password, confirmPassword: confirmPassword)
    }
    func loginBtnAction() {
        router?.navigateToLogin()
    }
}

