//
//  ProfileViewController.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IProfileViewController: class {
	var router: IProfileRouter? { get set }
}

class ProfileViewController: UIViewController {
	var interactor: IProfileInteractor?
	var router: IProfileRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension ProfileViewController: IProfileViewController {
	// do someting...
}

extension ProfileViewController {
	// do someting...
}

extension ProfileViewController {
	// do someting...
}
