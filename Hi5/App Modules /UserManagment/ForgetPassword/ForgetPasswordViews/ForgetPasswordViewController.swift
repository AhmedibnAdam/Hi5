//
//  ForgetPasswordViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IForgetPasswordViewController: class {
	var router: IForgetPasswordRouter? { get set }
}

class ForgetPasswordViewController: UIViewController {
    
    // MARK : - outlets
    @IBOutlet weak var HighFivePhoneBtn: UIButton!
    @IBOutlet weak var HighFiveEmailBtn: UIButton!
    @IBOutlet weak var BackBtn: UIButton!
    
    var interactor: IForgetPasswordInteractor?
	var router: IForgetPasswordRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
        configer()
    }
    
    //MARK : - Actions
    @IBAction func BackBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func HighFivePhoneTapped(_ sender: UIButton) {
        router?.navigateToForgetPhone()
    }
    
    @IBAction func HighFiveEmailTapped(_ sender: UIButton) {
        router?.navigateToForgetEmail()
    }
    
}

extension ForgetPasswordViewController: IForgetPasswordViewController {
	// MARK : - do someting...
}

extension ForgetPasswordViewController {
    func configer(){
        router = ForgetPasswordRouter(view: self)
    }
}

