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
    @IBAction func logout(_ sender: UIButton) {
        let defaults = UserDefaults.standard
                   let dictionary = defaults.dictionaryRepresentation()
                   dictionary.keys.forEach { key in
                       defaults.removeObject(forKey: key)
                   }
                   router?.navigateToLogin()
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
