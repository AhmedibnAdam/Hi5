//
//  PhoneVerificationViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPhoneVerificationViewController: class {
	var router: IPhoneVerificationRouter? { get set }
}

class PhoneVerificationViewController: UIViewController {
	var interactor: IPhoneVerificationInteractor?
	var router: IPhoneVerificationRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension PhoneVerificationViewController: IPhoneVerificationViewController {
	// do someting...
}

extension PhoneVerificationViewController {
	// do someting...
}

extension PhoneVerificationViewController {
	// do someting...
}
