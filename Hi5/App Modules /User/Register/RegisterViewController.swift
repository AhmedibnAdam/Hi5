//
//  RegisterViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IRegisterViewController: class {
	var router: IRegisterRouter? { get set }
}

class RegisterViewController: UIViewController {
	var interactor: IRegisterInteractor?
	var router: IRegisterRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension RegisterViewController: IRegisterViewController {
	// do someting...
}

extension RegisterViewController {
	// do someting...
}

extension RegisterViewController {
	// do someting...
}
