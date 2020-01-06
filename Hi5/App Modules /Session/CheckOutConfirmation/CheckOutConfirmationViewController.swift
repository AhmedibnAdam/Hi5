//
//  CheckOutConfirmationViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICheckOutConfirmationViewController: class {
	var router: ICheckOutConfirmationRouter? { get set }
}

class CheckOutConfirmationViewController: UIViewController {
	var interactor: ICheckOutConfirmationInteractor?
	var router: ICheckOutConfirmationRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension CheckOutConfirmationViewController: ICheckOutConfirmationViewController {
	// do someting...
}

extension CheckOutConfirmationViewController {
	// do someting...
}

extension CheckOutConfirmationViewController {
	// do someting...
}
