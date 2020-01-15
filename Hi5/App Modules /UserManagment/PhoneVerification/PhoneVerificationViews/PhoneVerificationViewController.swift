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
}

class PhoneVerificationViewController: UIViewController {
	var interactor: IPhoneVerificationInteractor?
	var router: IPhoneVerificationRouter?
    //MARK: - Outlets
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
		initView()
        configer()
    }
    //MARK: - Actions
    @IBAction func continueBtnTapped(_ sender: Any) {
        continueBtnAction()
    }
    
    @IBAction func resendBtnTapped(_ sender: Any) {
        
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
}

extension PhoneVerificationViewController {
    
    func initView(){
          // MARK : - Button  raduis
        self.continueBtn = CreateCornerRauis.ButtonRaduis(button: self.continueBtn, number: 5)
    }
    
    func configer(){
        router = PhoneVerificationRouter(view: self)
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
        //let code = text1+text2+text3+text4
        //interactor?.doSignupPhoneVerification(view: self, code: code)
    }
}

