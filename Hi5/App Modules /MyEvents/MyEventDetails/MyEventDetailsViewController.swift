//
//  MyEventDetailsViewController.swift
//  Hi5
//
//  Created by Adam on 7/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IMyEventDetailsViewController: class {
	var router: IMyEventDetailsRouter? { get set }
}

class MyEventDetailsViewController: UIViewController {
	var interactor: IMyEventDetailsInteractor?
	var router: IMyEventDetailsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension MyEventDetailsViewController: IMyEventDetailsViewController {
	// do someting...
}

extension MyEventDetailsViewController {
	// do someting...
}

extension MyEventDetailsViewController {
	// do someting...
}
