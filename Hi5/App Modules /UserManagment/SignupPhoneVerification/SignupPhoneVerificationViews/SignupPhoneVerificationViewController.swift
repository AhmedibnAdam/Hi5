//
//  SignupPhoneVerificationViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISignupPhoneVerificationViewController: class {
	var router: ISignupPhoneVerificationRouter? { get set }
    func showAlert(title: String, msg: String)
    func navigateToCreatePassword()
}

class SignupPhoneVerificationViewController: UIViewController {
	var interactor: ISignupPhoneVerificationInteractor?
	var router: ISignupPhoneVerificationRouter?
    
    //MARK:- Outlets
    
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var logoView: UIView!
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var descriptionLbl: UILabel!
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
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
         continueBtnAction()
        //router?.navigateToWelcome()
    }
    
    @IBAction func resendBtnTapped(_ sender: UIButton) {
        resendBtnAction()
    }
}
    //MARK:- extensions
extension SignupPhoneVerificationViewController: ISignupPhoneVerificationViewController {
	    func showAlert(title: String, msg: String) {
        ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    
    func navigateToCreatePassword() {
        router?.navigateToCreatePassword()
    }
 }

extension SignupPhoneVerificationViewController {
    func initView(){
        // MARK : - view raduis
        self.logoView = CreateCornerRauis.viewRaduis(view: self.logoView, number: (self.logoView.frame.size.height / 2))
        self.containerView1 = CreateCornerRauis.viewRaduis(view: self.containerView1, number: (self.containerView1.frame.size.height / 2))
        self.containerView2 = CreateCornerRauis.viewRaduis(view: self.containerView2, number: (self.containerView2.frame.size.height / 2))
        self.containerView3 = CreateCornerRauis.viewRaduis(view: self.containerView3, number: (self.containerView3.frame.size.height / 2))
        self.containerView4 = CreateCornerRauis.viewRaduis(view: self.containerView4, number: (self.containerView4.frame.size.height / 2))
          // MARK : - Button  raduis
        self.continueBtn = CreateCornerRauis.ButtonRaduis(button: self.continueBtn, number: 5)
    }
    
    func configer(){
        router = SignupPhoneVerificationRouter(view: self)
    }
}

extension SignupPhoneVerificationViewController {
    func continueBtnAction() {
        guard let text1 = textField1.text , let text2 = textField2.text , let text3 = textField3.text , let text4 = textField4.text else {return}
        if (text1.isEmpty || text2.isEmpty || text3.isEmpty || text4.isEmpty) {
            showAlert(title: "Error", msg: "Please Fill All Text Fields")
        } else if (text1.count > 1 || text2.count > 1 || text3.count > 1 || text4.count > 1){
            showAlert(title: "Error", msg: "Every Text Field Must Have One Number")
        }
        let code = text1+text2+text3+text4
        interactor?.doSignupPhoneVerification(view: self, code: code)
        
    }
    
    func resendBtnAction() {
        interactor?.doSignupResendVerificationCode(view: self)
    }
}

