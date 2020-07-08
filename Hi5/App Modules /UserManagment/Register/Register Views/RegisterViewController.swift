//
//  RegisterViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit
import DropDown
//import FlagPhoneNumber

protocol IRegisterViewController: class {
	var router: IRegisterRouter? { get set }
    func showAlert(title: String, msg: String)
    func hideIndicator()
}

class RegisterViewController: UIViewController , UITextFieldDelegate{
	var interactor: IRegisterInteractor?
	var router: IRegisterRouter?
    //MARK:- Outlets
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var checkBoxBtn: UIButton!
//    @IBOutlet weak var countryCode: FPNTextField!
//    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var fullNameView: UIView!
//    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var containerView4: UIView!
    @IBOutlet weak var containerView3: UIView!
    @IBOutlet weak var containerView2: UIView!
    @IBOutlet weak var containerView1: UIView!
    var dialCode: String?
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fullNameTextField.delegate = self
//        self.phoneNumberTextField.delegate = self
        initView()
        configure()
//        delegateCountryCode()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //MARK:- Actions
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        
        guard let name = fullNameTextField.text else {
             showAlert(title: "Alert", msg: "- At least 4 characters. \n - Username should start with latin letters. \n - Username can be only include latin letters, numbers and one of -,_, or . but no spical characters! \n - Username length shall less than 15 characters.")
            return
        }
       let valid =  isValidInput(Input: name)
        if valid {
            if (checkBoxBtn.currentImage == UIImage(named: "agreeCheckBox2")){
                navigateToCreateUserName()
            }
            else {
                showAlert(title: "Message", msg: "Please Accept Terms And Conditions")
            }
        }
        else {
            showAlert(title: "Alert", msg: "- At least 4 characters. \n - Username should start with latin letters. \n - Username can be only include latin letters, numbers and one of -,_, or . but no spical characters! \n - Username length shall less than 15 characters.")
        }
    }
    
    func isValidInput(Input:String) -> Bool {
        let RegEx = "\\w{7,18}"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: Input)
    }
    @IBAction func checkBoxBtn(_ sender: UIButton) {
        if sender.currentImage == UIImage(named:"checkBox") {
        sender.setImage(UIImage(named:"agreeCheckBox2"), for: .normal)
         }
        else if sender.currentImage == UIImage(named:"agreeCheckBox2") {
            sender.setImage( UIImage(named:"checkBox"), for: .normal)
        }
    }
    @IBAction func loginBtnTapped(_ sender: Any) {
        loginBtnAction()
    }
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
//MARK:- extensions
extension RegisterViewController: IRegisterViewController {
    func showAlert(title: String, msg: String) {
        ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    func navigateToCreateUserName() {
         guard let username = fullNameTextField.text else {return}
        router?.navigateToCreateUserName(param: ["full_name": username])
    }
    func hideIndicator() {
        loadingIndicator.isHidden = true
    }
}
extension RegisterViewController {
    func initView(){
        self.checkBoxBtn.setImage(UIImage(named: "checkBox"), for: .normal)
    }
    func configure(){
        router = RegisterRouter(view: self)
    } // why do we do this where we did in configurator file !
    func showIndicator() {
        loadingIndicator.isHidden = false
    }
}
extension RegisterViewController {
//    func signupAction() {
//        guard let fullName = fullNameTextField.text , let phoneNumber = phoneNumberTextField.text else {return}
//        let replacedDialCode = dialCode?.replacingOccurrences(of: "+", with: "")
//        let phone = (replacedDialCode ?? "966") + phoneNumber
//        print(phone)
//         if(fullName.isEmpty || phoneNumber.isEmpty){
//            fullNameView.viewBorderWidth = 1.0
//            fullNameView.viewBorderColor = UIColor.red
//            phoneNumberView.viewBorderWidth = 1.0
//            phoneNumberView.viewBorderColor = UIColor.red
//             return
//         }
//        let defaults = UserDefaults.standard
//        defaults.set(fullName, forKey: "FullName") as? String
//        showIndicator()
//        interactor?.doSignup(view: self, fullName: fullName, phoneNumber: phone)
//    }
    func loginBtnAction() {
        router?.navigateToLogin()
    }
}

//MARK:- DropDown Pod
extension RegisterViewController /*: FPNTextFieldDelegate */{
    
//    func delegateCountryCode() {
//        countryCode.inputView = FPNCountryPicker()
//        countryCode.setFlag(countryCode: .SA)
//        countryCode.hasPhoneNumberExample = false
//        countryCode.placeholder = ""
//        countryCode.delegate = self
//    }
    
    func fpnDisplayCountryList() {
    }
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code)
        self.dialCode = dialCode
    }

//    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
//        if isValid {
//            // Do something...
////            textField.getFormattedPhoneNumber(format: .E164)           // Output "+33600000001"
////            textField.getFormattedPhoneNumber(format: .International)  // Output "+33 6 00 00 00 01"
////            textField.getFormattedPhoneNumber(format: .National)       // Output "06 00 00 00 01"
////            textField.getFormattedPhoneNumber(format: .RFC3966)        // Output "tel:+33-6-00-00-00-01"
////            textField.getRawPhoneNumber()                               // Output "600000001"
//        } else {
//            // Do something...
//        }
//    }
}

