//
//  BookSessionViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IBookSessionViewController: class {
	var router: IBookSessionRouter? { get set }
}

class BookSessionViewController: UIViewController {
	var interactor: IBookSessionInteractor?
	var router: IBookSessionRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension BookSessionViewController: IBookSessionViewController {
	// do someting...
}

extension BookSessionViewController {
	// do someting...
}

extension BookSessionViewController {
	// do someting...
}
