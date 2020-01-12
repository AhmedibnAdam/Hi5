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

protocol ISignupPhoneVerificationViewController: class {
	var router: ISignupPhoneVerificationRouter? { get set }
}

class SignupPhoneVerificationViewController: UIViewController {
	var interactor: ISignupPhoneVerificationInteractor?
	var router: ISignupPhoneVerificationRouter?
    
    //MARK:- Outlets
    
    @IBOutlet weak var logoView: UIView!
    
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var containerView4: UIView!
    @IBOutlet weak var containerView3: UIView!
    @IBOutlet weak var containerView2: UIView!
    @IBOutlet weak var containerView1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        configer()
    }
    //MARK:- Actions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        router?.navigateToWelcome()
    }
    
    @IBAction func resendBtnTapped(_ sender: UIButton) {
    }
    
}
    //MARK:- extensions
extension SignupPhoneVerificationViewController: ISignupPhoneVerificationViewController {
	// do someting...
}

extension SignupPhoneVerificationViewController {
    func initView(){
        // MARK : - view raduis
        self.logoView = CreateCornerRauis.viewRaduis(view: self.logoView, number: (self.logoView.frame.size.height / 2))
        self.containerView1 = CreateCornerRauis.viewRaduis(view: self.containerView1, number: (self.containerView1.frame.size.height / 2))
        self.containerView2 = CreateCornerRauis.viewRaduis(view: self.containerView2, number: (self.containerView2.frame.size.height / 2))
        self.containerView3 = CreateCornerRauis.viewRaduis(view: self.containerView3, number: (self.containerView3.frame.size.height / 2))
        self.containerView4 = CreateCornerRauis.viewRaduis(view: self.containerView4, number: (self.containerView4.frame.size.height / 2))
          // MARK : - Button  raduis
        self.continueBtn = CreateCornerRauis.ButtonRaduis(button: self.continueBtn, number: 5)
    }
    
    func configer(){
        router = SignupPhoneVerificationRouter(view: self)
    }
}

