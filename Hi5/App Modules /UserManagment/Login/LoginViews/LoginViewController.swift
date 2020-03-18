//
//  LoginViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILoginViewController: class {
	var router: ILoginRouter? { get set }
    func showAlert(title: String, msg: String)
    func navigateToProfile()
    func navigateToTabBar()
    func navigateToFields()
    func hideIndecator()
    func setResponseToErrorLbl()
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    
	var interactor: ILoginInteractor?
	var router: ILoginRouter?
    //MARK: - view outlet
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var eyeBtn: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var profilePhoteView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
     //MARK: - buttons outlet
    @IBOutlet weak var signInOutlet: UIButton!
    @IBOutlet weak var SignupOutlet: UIButton!
    @IBOutlet weak var forgetPasswordOutlet: UIButton!
    @IBOutlet weak var doLoginButtonOutlet: UIButton!
    
    let loginModel = LoginModel()

	override func viewDidLoad() {
        super.viewDidLoad()
        self.userName.delegate = self
        self.password.delegate = self
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
    @IBAction func login(_ sender: UIButton) {
        
    }
    @IBAction func eyeBtnTapped(_ sender: UIButton) {
        if sender.currentImage == UIImage(named:"eyeLocked") {
           sender.setImage(UIImage(named:"eye"), for: .normal)
            self.password.isSecureTextEntry = false
         }
        else if sender.currentImage == UIImage(named:"eye") {
            sender.setImage( UIImage(named:"eyeLocked"), for: .normal)
            self.password.isSecureTextEntry = true
        }
    }
    
    @IBAction func ForgetPasswordTapped(_ sender: Any) {
        router?.navigateToForgetPassword()
    }
    @IBAction func signUP(_ sender: UIButton) {
        router?.navigateToSignUp()
    }
    @IBAction func doLogin(_ sender: UIButton) {
        
        doLoginAction()
    }
}
//MARK: - extenions
extension LoginViewController: ILoginViewController {
    func showAlert(title: String, msg: String) {
         ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    func navigateToProfile() {
        router?.navigateToProfile()
    }
    func navigateToTabBar() {
        router?.navigateToTabBar()
    }
    func navigateToFields() {
        router?.navigateToFields()
    }
    func hideIndecator() {
        loadingIndicator.isHidden = true
    }
    func setResponseToErrorLbl() {
        self.errorLbl.isHidden = false
        self.errorLbl.text = "userName Or Password is Incorrect"
    }
}

extension LoginViewController {
    func initView(){
        // MARK : - view raduis

    }
    
    func configer(){
        router = LoginRouter(view: self)
    }
    
    func showIndecator() {
        loadingIndicator.isHidden = false
    }
    
}

extension LoginViewController {
    func doLoginAction(){
        self.errorLbl.isHidden = true
        guard let userName = userName.text , let password = password.text else {return}
        if(userName.isEmpty || password.isEmpty || password.count < 4){
//            self.nameView = CreateBorder.viewBorder(view: self.nameView, width: 1.0, color: UIColor.red.cgColor)
//            self.passwordView = CreateBorder.viewBorder(view: self.passwordView, width: 1.0, color: UIColor.red.cgColor)
            self.errorLbl.isHidden = false
            self.errorLbl.text = "userName Or Password is Empty"
            return
        }
        showIndecator()
        interactor?.doLogin(view: self, userName: userName, password: password)
    }
}
