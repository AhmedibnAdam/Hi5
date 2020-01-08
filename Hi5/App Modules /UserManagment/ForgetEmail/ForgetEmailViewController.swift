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

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension ForgetEmailViewController: IForgetEmailViewController {
	// do someting...
}

extension ForgetEmailViewController {
	// do someting...
}

extension ForgetEmailViewController {
	// do someting...
}
