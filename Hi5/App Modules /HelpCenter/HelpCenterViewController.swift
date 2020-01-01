//
//  HelpCenterViewController.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IHelpCenterViewController: class {
	var router: IHelpCenterRouter? { get set }
}

class HelpCenterViewController: UIViewController {
	var interactor: IHelpCenterInteractor?
	var router: IHelpCenterRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension HelpCenterViewController: IHelpCenterViewController {
	// do someting...
}

extension HelpCenterViewController {
	// do someting...
}

extension HelpCenterViewController {
	// do someting...
}
