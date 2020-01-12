//
//  ChangeUsernameViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IChangeUsernameViewController: class {
	var router: IChangeUsernameRouter? { get set }
}

class ChangeUsernameViewController: UIViewController {
	var interactor: IChangeUsernameInteractor?
	var router: IChangeUsernameRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension ChangeUsernameViewController: IChangeUsernameViewController {
	// do someting...
}

extension ChangeUsernameViewController {
	// do someting...
}

extension ChangeUsernameViewController {
	// do someting...
}
