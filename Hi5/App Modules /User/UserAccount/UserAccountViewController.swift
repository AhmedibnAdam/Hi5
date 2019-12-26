//
//  UserAccountViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IUserAccountViewController: class {
	var router: IUserAccountRouter? { get set }
}

class UserAccountViewController: UIViewController {
	var interactor: IUserAccountInteractor?
	var router: IUserAccountRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension UserAccountViewController: IUserAccountViewController {
	// do someting...
}

extension UserAccountViewController {
	// do someting...
}

extension UserAccountViewController {
	// do someting...
}
