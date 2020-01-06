//
//  PublicEventsViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPublicEventsViewController: class {
	var router: IPublicEventsRouter? { get set }
}

class PublicEventsViewController: UIViewController {
	var interactor: IPublicEventsInteractor?
	var router: IPublicEventsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension PublicEventsViewController: IPublicEventsViewController {
	// do someting...
}

extension PublicEventsViewController {
	// do someting...
}

extension PublicEventsViewController {
	// do someting...
}
