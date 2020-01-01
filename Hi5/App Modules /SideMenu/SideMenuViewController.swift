//
//  SideMenuViewController.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISideMenuViewController: class {
	var router: ISideMenuRouter? { get set }
}

class SideMenuViewController: UIViewController {
	var interactor: ISideMenuInteractor?
	var router: ISideMenuRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension SideMenuViewController: ISideMenuViewController {
	// do someting...
}

extension SideMenuViewController {
	// do someting...
}

extension SideMenuViewController {
	// do someting...
}
