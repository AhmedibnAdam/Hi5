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
    
    
    var ssss: String?
    
    
    // view outlet
    @IBOutlet weak var profilePhoteView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
     // buttons outlet
    @IBOutlet weak var signInOutlet: UIButton!
    @IBOutlet weak var SignupOutlet: UIButton!
    @IBOutlet weak var forgetPasswordOutlet: UIButton!
    @IBOutlet weak var doLoginButtonOutlet: UIButton!
    
    let loginModel = LoginModel()

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        
        initView()
        configer()
        
    }
    
    // Actions
    @IBAction func login(_ sender: UIButton) {
        
    }
    @IBAction func signUP(_ sender: UIButton) {
        router?.navigateToNext()
    }
    @IBAction func doLogin(_ sender: UIButton) {
        doLoginAction()
    }
    
    
}

extension LoginViewController: ILoginViewController {
    func showAlert(title: String, msg: String) {
         ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    
   
    

    
	// do someting...
}

extension LoginViewController {
    func initView(){
        
        
        // view raduis
        self.profilePhoteView = CreateCornerRauis.viewRaduis(view: self.profilePhoteView, number: (self.profilePhoteView.frame.size.height / 2))
        self.nameView = CreateCornerRauis.viewRaduis(view: self.nameView, number: 5)
        self.passwordView = CreateCornerRauis.viewRaduis(view: self.passwordView, number: 5)
        
        
          // Button  raduis
        self.doLoginButtonOutlet = CreateCornerRauis.ButtonRaduis(button: self.doLoginButtonOutlet, number: 5)
      
    }
    func configer(){
        router = LoginRouter(view: self)
    }
}

extension LoginViewController {
	// do someting...
    
    func doLoginAction(){
        self.nameView = CreateBorder.viewBorder(view: self.nameView, width: 1.0, color: UIColor.red.cgColor)
        self.passwordView = CreateBorder.viewBorder(view: self.passwordView, width: 1.0, color: UIColor.red.cgColor)
        
//        interactor?.parameters = ["name":"Ahmed", "passowrd":"1234566"]
        interactor?.doLogin(view: self)
     
    }
    
}
