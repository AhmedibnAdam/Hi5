//
//  AddFriendRequestViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAddFriendRequestViewController: class {
	var router: IAddFriendRequestRouter? { get set }
}

class AddFriendRequestViewController: UIViewController {
	var interactor: IAddFriendRequestInteractor?
	var router: IAddFriendRequestRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension AddFriendRequestViewController: IAddFriendRequestViewController {
	// do someting...
}

extension AddFriendRequestViewController {
	// do someting...
}

extension AddFriendRequestViewController {
	// do someting...
}
