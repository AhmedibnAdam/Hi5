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
import WebKit

protocol IRegisterViewController: class {
	var router: IRegisterRouter? { get set }
    func showAlert(title: String, msg: String)
    func hideIndicator()
    func showTerms(response: RegisterModel.AuthError?)
}

class RegisterViewController: UIViewController , UITextFieldDelegate{
	var interactor: IRegisterInteractor?
	var router: IRegisterRouter?
    let webView = WKWebView()
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
             showAlert(title: "Alert", msg: "- At least 5 characters. \n - Username should start with latin letters. \n - Username can be only include latin letters, numbers and one of -,_, or . but no spical characters! \n - Username length shall less than 15 characters.")
            return
        }
        
        if name.count < 5 {
            showAlert(title: "Alert", msg: "- At least 5 characters. ")
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
            showAlert(title: "Alert", msg: "- At least 5 characters. \n - Username should start with latin letters. \n - Username can be only include latin letters, numbers and one of -,_, or . but no spical characters! \n - Username length shall less than 15 characters.")
        }
    }
    
    func isValidInput(Input:String) -> Bool {
//        let RegEx = "\\w{7,18}"
//        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return true //Test.evaluate(with: Input)
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
    
    @IBAction func terms(_ sender: UIButton) {
        interactor?.terms()
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
    func showTerms(response: RegisterModel.AuthError?){
        guard let linkk = response?.url else {
            return
        }
        self.navigate(type: .modalWithNavigation, module: GeneralRoute.terms(url: linkk), completion: nil)

    }
}
extension RegisterViewController: WKUIDelegate {


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
}

