//
//  PhoneVerificationViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import DropDown
import FlagPhoneNumber

protocol IPhoneVerificationViewController: class {
	var router: IPhoneVerificationRouter? { get set }
    func showAlert(title: String, msg: String)
    func navigateToProfile()
    func hideIndicator()
}

class PhoneVerificationViewController: UIViewController, UITextFieldDelegate {
	var interactor: IPhoneVerificationInteractor?
	var router: IPhoneVerificationRouter?
    
    var phone: String?
    var dialCode: String?
    //MARK: - Outlets
    
        @IBOutlet weak var countryCode: FPNTextField!
        @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        dialCode = "966"
        countryCode.delegate = self
        countryCode.selectedCountry?.code = .SA
        self.textField1.delegate = self
        self.textField2.delegate = self
        self.textField3.delegate = self
        self.textField4.delegate = self
        configer()
    
        textField1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        textField2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        textField3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        textField4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)

        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            textField1.becomeFirstResponder()

        }
    @objc func textFieldDidChange(textField: UITextField){

            let text = textField.text

            if text?.utf16.count==1{
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
    @IBOutlet weak var sendVerifyBtn: UIButton!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    //MARK: - Actions
    @IBAction func sendVerificationCode(_ sender: UIButton) {
        
        guard let number = countryCode.text  else {
            
            return}
        guard let dial = dialCode  else {
            
            return}
        let  phone = dial + number
        self.phone = phone
            print(phone)
      sendCode()
    }
    func sendCode(){
       
        interactor?.doSendVerificationCode(view: self)
        counterSend()
    }
    
    
    var timer : Timer?
    var counter = 30



    @objc func prozessTimer() {
        counter -= 1
        print("This is a second ", counter)
        sendVerifyBtn.setTitle("\(counter)", for: .normal)
        
        
        if counter <= 0 {
            sendVerifyBtn.isEnabled = true
            sendVerifyBtn.setTitle("Resend", for: .normal)
            counter = 30
        timer?.invalidate()
              timer = nil
        }
    }
    func counterSend(){
        
        sendVerifyBtn.isEnabled = false
        timer = Timer.scheduledTimer(timeInterval:1, target:self, selector:#selector(prozessTimer), userInfo: nil, repeats: true)

        
    }
    
    @IBAction func continueBtnTapped(_ sender: Any) {
        showIndicator()
        continueBtnAction()
    }
    
    @IBAction func resendBtnTapped(_ sender: Any) {
        showIndicator()
        resendBtnAction()
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
//MARK: - extensions
extension PhoneVerificationViewController: IPhoneVerificationViewController {
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

extension PhoneVerificationViewController {
    func configer(){
        router = PhoneVerificationRouter(view: self)
    }
    
    func showIndicator() {
        guard let phoneNum = self.phone  else {
               
               return}
               var phone = phoneNum
               phone.removeFirst()
               interactor?.doSendphone(phone: phone )
        loadingIndicator.isHidden = false
    }
}

extension PhoneVerificationViewController {
    func continueBtnAction() {
        guard let text1 = textField1.text , let text2 = textField2.text , let text3 = textField3.text , let text4 = textField4.text else {return}
        if (text1.isEmpty || text2.isEmpty || text3.isEmpty || text4.isEmpty) {
            showAlert(title: "Error", msg: "Please Fill All Text Fields")
        } else if (text1.count > 1 || text2.count > 1 || text3.count > 1 || text4.count > 1){
            showAlert(title: "Error", msg: "Every Text Field Must Have One Number")
        }
        let code = text1+text2+text3+text4
        interactor?.doPhoneVerification(view: self, code: code)
    }
    
    func resendBtnAction() {
        interactor?.doResendVerificationCode(view: self)
    }
}

extension PhoneVerificationViewController: FPNTextFieldDelegate{
    
    
    func fpnDisplayCountryList() {
        
    }
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code)
        self.dialCode = dialCode
    }

        func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
            
           
            
         
        }
    
}
