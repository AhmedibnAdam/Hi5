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
    func hideIndicator()
}

class SignupPhoneVerificationViewController: UIViewController, UITextFieldDelegate {
	var interactor: ISignupPhoneVerificationInteractor?
	var router: ISignupPhoneVerificationRouter?
    var count = 0
    
    //MARK:- Outlets
    
    @IBOutlet weak var counterResendLbl: UILabel!
    @IBOutlet weak var resendBtn: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
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
    //MARK:- View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField1.delegate = self
        self.textField2.delegate = self
        self.textField3.delegate = self
        self.textField4.delegate = self
        textField1.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        textField2.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        textField3.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        textField4.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
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
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    //MARK:- Actions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
         continueBtnAction()
    }
    
    @IBAction func resendBtnTapped(_ sender: UIButton) {
        resendBtnAction()
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        router?.navigateToLogin()
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
    
    func hideIndicator() {
        loadingIndicator.isHidden = true
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
    
    func showIndicator() {
        loadingIndicator.isHidden = false
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        if (text?.utf16.count)! >= 1{
            switch textField{
            case textField1:
                textField2.becomeFirstResponder()
            case textField2:
                textField3.becomeFirstResponder()
            case textField3:
                textField4.becomeFirstResponder()
            case textField4:
                textField4.resignFirstResponder()
            default:
                break
            }
        }else{

        }
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
        showIndicator()
        let code = text1+text2+text3+text4
        interactor?.doSignupPhoneVerification(view: self, code: code)
       // counterResendLbl.isHidden = false
//        while count != 30 {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
//                self.count += 1
//                self.counterResendLbl.text = "\(self.count)"
//            })
//        }
        
//        counterResendLbl.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 30.0, execute: {
           self.resendBtn.isEnabled = true
        })
        
    }
    
    func resendBtnAction() {
         showIndicator()
         self.interactor?.doSignupResendVerificationCode(view: self)
    }
}


