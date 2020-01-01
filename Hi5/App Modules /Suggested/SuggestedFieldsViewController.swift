//
//  SuggestedFieldsViewController.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISuggestedFieldsViewController: class {
	var router: ISuggestedFieldsRouter? { get set }
}

class SuggestedFieldsViewController: UIViewController {
	var interactor: ISuggestedFieldsInteractor?
	var router: ISuggestedFieldsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension SuggestedFieldsViewController: ISuggestedFieldsViewController {
	// do someting...
}

extension SuggestedFieldsViewController {
	// do someting...
}

extension SuggestedFieldsViewController {
	// do someting...
}
