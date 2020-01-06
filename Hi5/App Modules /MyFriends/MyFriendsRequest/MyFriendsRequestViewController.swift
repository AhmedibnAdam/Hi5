//
//  MyFriendsRequestViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFriendsRequestViewController: class {
	var router: IMyFriendsRequestRouter? { get set }
}

class MyFriendsRequestViewController: UIViewController {
	var interactor: IMyFriendsRequestInteractor?
	var router: IMyFriendsRequestRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension MyFriendsRequestViewController: IMyFriendsRequestViewController {
	// do someting...
}

extension MyFriendsRequestViewController {
	// do someting...
}

extension MyFriendsRequestViewController {
	// do someting...
}
