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

protocol IPhoneVerificationViewController: class {
	var router: IPhoneVerificationRouter? { get set }
    func showAlert(title: String, msg: String)
    func navigateToCreatePassword()
    func hideIndicator()
}

class PhoneVerificationViewController: UIViewController, UITextFieldDelegate {
	var interactor: IPhoneVerificationInteractor?
	var router: IPhoneVerificationRouter?
    //MARK: - Outlets
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField1.delegate = self
        self.textField2.delegate = self
        self.textField3.delegate = self
        self.textField4.delegate = self
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
    func navigateToCreatePassword() {
        router?.navigateToCreatePassword()
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

