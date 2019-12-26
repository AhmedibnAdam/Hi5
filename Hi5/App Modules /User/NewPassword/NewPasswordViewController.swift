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

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension NewPasswordViewController: INewPasswordViewController {
	// do someting...
}

extension NewPasswordViewController {
	// do someting...
}

extension NewPasswordViewController {
	// do someting...
}
