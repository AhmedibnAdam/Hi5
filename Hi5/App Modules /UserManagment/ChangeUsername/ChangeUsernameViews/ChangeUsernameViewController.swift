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
}

class ChangeUsernameViewController: UIViewController, UITextFieldDelegate {
	var interactor: IChangeUsernameInteractor?
	var router: IChangeUsernameRouter?
    //MARK:- Outlets

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var checkMark: UIImageView!
    @IBOutlet weak var changeBtn: UIButton!
    @IBOutlet weak var containerView4: UIView!
    @IBOutlet weak var containerView3: UIView!
    @IBOutlet weak var containerView1: UIView!
    @IBOutlet weak var containerView2: UIView!
    @IBOutlet weak var logoView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usernameTextField.delegate = self
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
         ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
    func navigateToCreatePassword() {
        router?.navigateToCreatePassword()
    }
}

extension ChangeUsernameViewController {
    func initView(){
        // MARK : - view raduis
        self.logoView = CreateCornerRauis.viewRaduis(view: self.logoView, number: (self.logoView.frame.size.height / 2))
        self.containerView1 = CreateCornerRauis.viewRaduis(view: self.containerView1, number: (self.containerView1.frame.size.height / 2))
        self.containerView2 = CreateCornerRauis.viewRaduis(view: self.containerView2, number: (self.containerView2.frame.size.height / 2))
        self.containerView3 = CreateCornerRauis.viewRaduis(view: self.containerView3, number: (self.containerView3.frame.size.height / 2))
        self.containerView4 = CreateCornerRauis.viewRaduis(view: self.containerView4, number: (self.containerView4.frame.size.height / 2))
          // MARK : - Button  raduis
        self.changeBtn = CreateCornerRauis.ButtonRaduis(button: self.changeBtn, number: 5)
    }
    
    func configer(){
        router = ChangeUsernameRouter(view: self)
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
        interactor?.doChangeUserName(view: self, username: username)
    }
    
    func loginBtnAction() {
        router?.navigateToLogin()

    }
}

