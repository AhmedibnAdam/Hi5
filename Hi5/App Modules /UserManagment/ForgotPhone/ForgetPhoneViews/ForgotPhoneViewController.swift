//
//  ForgotPhoneViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IForgotPhoneViewController: class {
	var router: IForgotPhoneRouter? { get set }
}

class ForgotPhoneViewController: UIViewController {
	var interactor: IForgotPhoneInteractor?
	var router: IForgotPhoneRouter?
    //MARK : - Outlets
    @IBOutlet weak var continueBtn: UIButton!
    

	override func viewDidLoad() {
        super.viewDidLoad()
		initView()
        configer()
    }
    // MARK : - Actions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueBtnTapped(_ sender: Any) {
        
    }
}

extension ForgotPhoneViewController: IForgotPhoneViewController {
	// do someting...
}

extension ForgotPhoneViewController {
	    func initView(){
    // MARK : - Button  raduis
        self.continueBtn = CreateCornerRauis.ButtonRaduis(button: self.continueBtn, number: 5)
    }
    
    func configer(){
        router = ForgotPhoneRouter(view: self)
    }
}

