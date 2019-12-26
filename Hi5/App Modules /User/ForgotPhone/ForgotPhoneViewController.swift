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

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension ForgotPhoneViewController: IForgotPhoneViewController {
	// do someting...
}

extension ForgotPhoneViewController {
	// do someting...
}

extension ForgotPhoneViewController {
	// do someting...
}
