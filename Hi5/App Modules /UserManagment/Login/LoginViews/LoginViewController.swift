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
}

class LoginViewController: UIViewController {
    
	var interactor: ILoginInteractor?
	var router: ILoginRouter?
    //MARK: - view outlet
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
        initView()
        configer()
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
}

extension LoginViewController {
    func initView(){
        // MARK : - view raduis
        self.eyeBtn.setImage(UIImage(named: "eyeLocked"), for: .normal)
        self.profilePhoteView = CreateCornerRauis.viewRaduis(view: self.profilePhoteView, number: (self.profilePhoteView.frame.size.height / 2))
        self.nameView = CreateCornerRauis.viewRaduis(view: self.nameView, number: 5)
        self.passwordView = CreateCornerRauis.viewRaduis(view: self.passwordView, number: 5)
          // MARK : - Button  raduis
        self.doLoginButtonOutlet = CreateCornerRauis.ButtonRaduis(button: self.doLoginButtonOutlet, number: 5)
    }
    
    func configer(){
        router = LoginRouter(view: self)
    }
}

extension LoginViewController {
    func doLoginAction(){
        guard let userName = userName.text , let password = password.text else {return}
        if(userName.isEmpty || password.isEmpty || password.count < 4){
            self.nameView = CreateBorder.viewBorder(view: self.nameView, width: 1.0, color: UIColor.red.cgColor)
            self.passwordView = CreateBorder.viewBorder(view: self.passwordView, width: 1.0, color: UIColor.red.cgColor)
            return
        }
        interactor?.doLogin(view: self, userName: userName, password: password)
    }
    
}
