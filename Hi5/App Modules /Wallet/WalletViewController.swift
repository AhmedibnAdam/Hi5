//
//  WalletViewController.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IWalletViewController: class {
	var router: IWalletRouter? { get set }
}

class WalletViewController: UIViewController {
	var interactor: IWalletInteractor?
	var router: IWalletRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension WalletViewController: IWalletViewController {
	// do someting...
}

extension WalletViewController {
	// do someting...
}

extension WalletViewController {
	// do someting...
}
