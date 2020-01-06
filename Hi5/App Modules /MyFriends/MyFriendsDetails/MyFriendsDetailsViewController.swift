//
//  MyFriendsDetailsViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFriendsDetailsViewController: class {
	var router: IMyFriendsDetailsRouter? { get set }
}

class MyFriendsDetailsViewController: UIViewController {
	var interactor: IMyFriendsDetailsInteractor?
	var router: IMyFriendsDetailsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension MyFriendsDetailsViewController: IMyFriendsDetailsViewController {
	// do someting...
}

extension MyFriendsDetailsViewController {
	// do someting...
}

extension MyFriendsDetailsViewController {
	// do someting...
}
