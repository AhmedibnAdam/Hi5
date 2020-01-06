//
//  MakeWalletPasswordViewController.swift
//  Hi5
//
//  Created by Adam on 1/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMakeWalletPasswordViewController: class {
	var router: IMakeWalletPasswordRouter? { get set }
}

class MakeWalletPasswordViewController: UIViewController {
	var interactor: IMakeWalletPasswordInteractor?
	var router: IMakeWalletPasswordRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension MakeWalletPasswordViewController: IMakeWalletPasswordViewController {
	// do someting...
}

extension MakeWalletPasswordViewController {
	// do someting...
}

extension MakeWalletPasswordViewController {
	// do someting...
}
