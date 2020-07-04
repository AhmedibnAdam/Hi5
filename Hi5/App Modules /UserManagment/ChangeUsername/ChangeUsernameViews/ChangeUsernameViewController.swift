//
//  ChangeUsernameViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IChangeUsernameViewController: class {
	var router: IChangeUsernameRouter? { get set }
    func showAlert(title: String, msg: String)
    func navigateToCreatePassword()
    func hideIndicator()
}

class ChangeUsernameViewController: UIViewController {
	var interactor: IChangeUsernameInteractor?
	var router: IChangeUsernameRouter?

    var parameters: [String: Any]?
    //MARK:- Outlets

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var checkMark: UIImageView!
    @IBOutlet weak var changeBtn: UIButton!
    @IBOutlet weak var containerView4: UIView!
    @IBOutlet weak var containerView3: UIView!
    @IBOutlet weak var containerView1: UIView!
    @IBOutlet weak var containerView2: UIView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var errorMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usernameTextField.delegate = self
        errorMessage.text = ""
        configer()
    }
  
    //MARK:- Actions
    @IBAction func changeBtnTapped(_ sender: UIButton) {
        changeBtnAction()
    }
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        loginBtnAction()
    }
}
   //MARK:- extensions
extension ChangeUsernameViewController: IChangeUsernameViewController {
    func showAlert(title: String, msg: String) {
        errorMessage.text = msg
//         ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    func navigateToCreatePassword() {
        guard let username = usernameTextField.text else {return}
        parameters?["vie_id"] = username
        router?.navigateToCreatePassword(param: parameters!)
    }
    func hideIndicator() {
        loadingIndicator.isHidden = true
    }
}

extension ChangeUsernameViewController {
    func configer(){
        router = ChangeUsernameRouter(view: self)
    }
    
    func showIndicator() {
        loadingIndicator.isHidden = false
    }
}

extension ChangeUsernameViewController {
    func changeBtnAction() {
        guard let username = usernameTextField.text else {return}
        if(username.isEmpty){
            showAlert(title: "Error", msg: "Please Fill Empty Field")
            return
        } else if (username.count < 3) {
            showAlert(title: "Error", msg: "Username Must Be More Than 3 Character")
            return
        } else {
            checkMark.isHidden = false
        }
        showIndicator()
        interactor?.doChangeUserName(view: self, username: username)
    }
    
    func loginBtnAction() {
        
        router?.navigateToLogin()
    }
}

extension ChangeUsernameViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
      }
      
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          self.view.endEditing(true)
          return false
      }
}
