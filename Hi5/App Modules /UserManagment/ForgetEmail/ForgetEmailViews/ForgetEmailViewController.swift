//
//  ForgetEmailViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IForgetEmailViewController: class {
	var router: IForgetEmailRouter? { get set }
}

class ForgetEmailViewController: UIViewController {
	var interactor: IForgetEmailInteractor?
	var router: IForgetEmailRouter?
    //MARK : - Outlets
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
	override func viewDidLoad() {
        super.viewDidLoad()
		initView()
        configer()
    }
    //MARK : - Actions
    @IBAction func continueBtnTapped(_ sender: Any) {
        router?.navigateToVerificationEmail()
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension ForgetEmailViewController: IForgetEmailViewController {
	// do someting...
}

extension ForgetEmailViewController {
	    func initView(){
        // MARK : - view raduis
        self.containerView = CreateCornerRauis.viewRaduis(view: self.containerView, number: 5)
        // MARK : - Button  raduis
        self.continueBtn = CreateCornerRauis.ButtonRaduis(button: self.continueBtn, number: 5)
    }
    
    func configer(){
        router = ForgetEmailRouter(view: self)
    }
}

