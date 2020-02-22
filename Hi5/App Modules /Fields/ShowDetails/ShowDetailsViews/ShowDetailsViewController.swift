//
//  ShowDetailsViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IShowDetailsViewController: class {
	var router: IShowDetailsRouter? { get set }
}

class ShowDetailsViewController: UIViewController {
	var interactor: IShowDetailsInteractor?
	var router: IShowDetailsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension ShowDetailsViewController: IShowDetailsViewController {
	// do someting...
}

extension ShowDetailsViewController {
	// do someting...
}

extension ShowDetailsViewController {
	// do someting...
}
