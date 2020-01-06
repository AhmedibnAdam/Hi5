//
//  AddSessionResultFiltterViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddSessionResultFiltterViewController: class {
	var router: IAddSessionResultFiltterRouter? { get set }
}

class AddSessionResultFiltterViewController: UIViewController {
	var interactor: IAddSessionResultFiltterInteractor?
	var router: IAddSessionResultFiltterRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension AddSessionResultFiltterViewController: IAddSessionResultFiltterViewController {
	// do someting...
}

extension AddSessionResultFiltterViewController {
	// do someting...
}

extension AddSessionResultFiltterViewController {
	// do someting...
}
