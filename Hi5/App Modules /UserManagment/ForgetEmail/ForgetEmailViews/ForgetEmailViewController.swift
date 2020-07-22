//
//  ForgetEmailViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import UIKit

protocol IForgetEmailViewController: class {
	var router: IForgetEmailRouter? { get set }
    func showAlert(title: String, msg: String)
    func navigateToEmailVerification()
}

class ForgetEmailViewController: UIViewController, UITextFieldDelegate {
	var interactor: IForgetEmailInteractor?
	var router: IForgetEmailRouter?
    
    //MARK:- Outlets
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.delegate = self
        configer()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    //MARK:- Actions
    @IBAction func continueBtnTapped(_ sender: Any) {
        showIndicator()
        continueBtnAction()
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
//MARK:- Extensions
extension ForgetEmailViewController: IForgetEmailViewController {
    func showAlert(title: String, msg: String) {
         ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    func navigateToEmailVerification() {
       router?.navigateToVerificationEmail()
    }
}

extension ForgetEmailViewController {
    func configer(){
        router = ForgetEmailRouter(view: self)
    }
    
    func showIndicator() {
        loadingIndicator.isHidden = false
    }
}

extension ForgetEmailViewController {
    func continueBtnAction() {
        guard let email = emailTextField.text else {
            return
        }
        if(email.isEmpty == true) {
            containerView.viewBorderWidth = 1.0
            containerView.viewBorderColor = UIColor.red
        }
        let defaults = UserDefaults.standard
        defaults.set(email, forKey: "Email") as? String
        interactor?.doForgetEmail(view: self, email: email)
    }
}

