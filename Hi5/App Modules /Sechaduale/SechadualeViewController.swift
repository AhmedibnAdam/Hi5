//
//  SechadualeViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISechadualeViewController: class {
	var router: ISechadualeRouter? { get set }
}

class SechadualeViewController: UIViewController {
	var interactor: ISechadualeInteractor?
	var router: ISechadualeRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension SechadualeViewController: ISechadualeViewController {
	// do someting...
}

extension SechadualeViewController {
	// do someting...
}

extension SechadualeViewController {
	// do someting...
}
