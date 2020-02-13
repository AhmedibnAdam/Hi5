//
//  SocialViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/11/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISocialViewController: class {
	var router: ISocialRouter? { get set }
}

class SocialViewController: UIViewController {
	var interactor: ISocialInteractor?
	var router: ISocialRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension SocialViewController: ISocialViewController {
	// do someting...
}

extension SocialViewController {
	// do someting...
}

extension SocialViewController {
	// do someting...
}
