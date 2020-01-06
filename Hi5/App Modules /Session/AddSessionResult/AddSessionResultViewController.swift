//
//  AddSessionResultViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddSessionResultViewController: class {
	var router: IAddSessionResultRouter? { get set }
}

class AddSessionResultViewController: UIViewController {
	var interactor: IAddSessionResultInteractor?
	var router: IAddSessionResultRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension AddSessionResultViewController: IAddSessionResultViewController {
	// do someting...
}

extension AddSessionResultViewController {
	// do someting...
}

extension AddSessionResultViewController {
	// do someting...
}
