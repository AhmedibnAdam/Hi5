//
//  AddFundViewController.swift
//  Hi5
//
//  Created by Adam on 1/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddFundViewController: class {
	var router: IAddFundRouter? { get set }
}

class AddFundViewController: UIViewController {
	var interactor: IAddFundInteractor?
	var router: IAddFundRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension AddFundViewController: IAddFundViewController {
	// do someting...
}

extension AddFundViewController {
	// do someting...
}

extension AddFundViewController {
	// do someting...
}
