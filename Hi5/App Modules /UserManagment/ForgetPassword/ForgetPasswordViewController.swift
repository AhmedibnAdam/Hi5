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
	var interactor: IForgetPasswordInteractor?
	var router: IForgetPasswordRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension ForgetPasswordViewController: IForgetPasswordViewController {
	// do someting...
}

extension ForgetPasswordViewController {
	// do someting...
}

extension ForgetPasswordViewController {
	// do someting...
}
