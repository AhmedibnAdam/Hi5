//
//  EmailVerficationViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IEmailVerficationViewController: class {
	var router: IEmailVerficationRouter? { get set }
}

class EmailVerficationViewController: UIViewController {
	var interactor: IEmailVerficationInteractor?
	var router: IEmailVerficationRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension EmailVerficationViewController: IEmailVerficationViewController {
	// do someting...
}

extension EmailVerficationViewController {
	// do someting...
}

extension EmailVerficationViewController {
	// do someting...
}
