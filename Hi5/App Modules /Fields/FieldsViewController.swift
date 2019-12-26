//
//  FieldsViewController.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFieldsViewController: class {
	var router: IFieldsRouter? { get set }
}

class FieldsViewController: UIViewController {
	var interactor: IFieldsInteractor?
	var router: IFieldsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension FieldsViewController: IFieldsViewController {
	// do someting...
}

extension FieldsViewController {
	// do someting...
}

extension FieldsViewController {
	// do someting...
}
