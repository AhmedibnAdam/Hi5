//
//  SettingViewController.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISettingViewController: class {
	var router: ISettingRouter? { get set }
}

class SettingViewController: UIViewController {
	var interactor: ISettingInteractor?
	var router: ISettingRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension SettingViewController: ISettingViewController {
	// do someting...
}

extension SettingViewController {
	// do someting...
}

extension SettingViewController {
	// do someting...
}
