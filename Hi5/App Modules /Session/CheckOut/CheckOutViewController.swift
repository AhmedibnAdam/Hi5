//
//  CheckOutViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICheckOutViewController: class {
	var router: ICheckOutRouter? { get set }
}

class CheckOutViewController: UIViewController {
	var interactor: ICheckOutInteractor?
	var router: ICheckOutRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension CheckOutViewController: ICheckOutViewController {
	// do someting...
}

extension CheckOutViewController {
	// do someting...
}

extension CheckOutViewController {
	// do someting...
}