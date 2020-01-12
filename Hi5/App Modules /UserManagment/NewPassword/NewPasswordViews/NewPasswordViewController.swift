//
//  NewPasswordViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol INewPasswordViewController: class {
	var router: INewPasswordRouter? { get set }
}

class NewPasswordViewController: UIViewController {
	var interactor: INewPasswordInteractor?
	var router: INewPasswordRouter?
    //MARK:- Outlets
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var getStartedBtn: UIButton!
    @IBOutlet weak var newPasswordView: UIView!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        configer()
    }
    //MARK: - Actions
    @IBAction func getStartedBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        
    }
}
//MARK:- extensions
extension NewPasswordViewController: INewPasswordViewController {
	// do someting...
}

extension NewPasswordViewController {
    func initView(){
        // MARK : - view raduis
        self.logoView = CreateCornerRauis.viewRaduis(view: self.logoView, number: (self.logoView.frame.size.height / 2))
        self.newPasswordView = CreateCornerRauis.viewRaduis(view: self.newPasswordView, number: 5)
        self.confirmPasswordView = CreateCornerRauis.viewRaduis(view: self.confirmPasswordView, number: 5)
          // MARK : - Button  raduis
        self.getStartedBtn = CreateCornerRauis.ButtonRaduis(button: self.getStartedBtn, number: 5)
    }
    
    func configer(){
        router = NewPasswordRouter(view: self)
    }
}

