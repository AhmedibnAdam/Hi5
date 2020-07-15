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
import FlagPhoneNumber

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
    
    var phone: String?
       var dialCode: String?
    
    //MARK:- Outlets
    
    @IBOutlet weak var resendBtn: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var logoView: UIView!
    
    @IBOutlet weak var phoneText: FPNTextField!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var descriptionLbl: UILabel!

    //MARK:- View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneText.delegate = self
        self.textField1.delegate = self
        self.textField2.delegate = self
        self.textField3.delegate = self
        self.textField4.delegate = self
        textField1.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        textField2.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        textField3.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        textField4.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        configer()
        dialCode = "966"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    private func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    //MARK:- Actions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendVerificationCode(_ sender: UIButton) {
        
        guard let phoneNum = self.phoneText.text  else {
            return}
        guard let dial = dialCode  else {
            
            return}
        let  phone = dial + phoneNum
        
        var telephone = phone.replacingOccurrences(of: " ", with: "")
        telephone.removeFirst()
        self.phone = telephone
        interactor?.forgetPassword(phone: telephone)
        
    }
    @IBAction func continueBtnTapped(_ sender: UIButton) {
             guard let text1 = textField1.text , let text2 = textField2.text , let text3 = textField3.text , let text4 = textField4.text else {return}
             if (text1.isEmpty || text2.isEmpty || text3.isEmpty || text4.isEmpty) {
                 showAlert(title: "Error", msg: "Please Fill All Text Fields")
             } else if (text1.count > 1 || text2.count > 1 || text3.count > 1 || text4.count > 1){
                 showAlert(title: "Error", msg: "Every Text Field Must Have One Number")
             }
             let code = text1+text2+text3+text4
        showIndicator()
      
        guard let phone = self.phone else {
            return
        }
        let telephone = phone.replacingOccurrences(of: "-", with: "")
        self.phone = telephone
        interactor?.sendCodeAndPhone(phone: telephone, code: code)
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
        guard let phone = self.phone else {
            return
        }
        router?.navigateToCreatePassword(phone: phone)
    }
    
    func hideIndicator() {
        loadingIndicator.isHidden = true
    }
 }

extension SignupPhoneVerificationViewController: FPNTextFieldDelegate {
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code)
              self.dialCode = dialCode
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        
    }
    
    func fpnDisplayCountryList() {
       
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
    func resendBtnAction() {
         showIndicator()
         self.interactor?.doSignupResendVerificationCode(view: self)
    }
}


