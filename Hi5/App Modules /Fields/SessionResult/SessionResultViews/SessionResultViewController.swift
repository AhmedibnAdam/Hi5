//
//  SessionResultViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/4/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISessionResultViewController: class {
	var router: ISessionResultRouter? { get set }
}

class SessionResultViewController: UIViewController {
	var interactor: ISessionResultInteractor?
	var router: ISessionResultRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension SessionResultViewController: ISessionResultViewController {
	// do someting...
}

extension SessionResultViewController {
	// do someting...
}

extension SessionResultViewController {
	// do someting...
}
