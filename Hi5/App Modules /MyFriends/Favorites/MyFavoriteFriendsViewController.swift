//
//  MyFavoriteFriendsViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyFavoriteFriendsViewController: class {
	var router: IMyFavoriteFriendsRouter? { get set }
}

class MyFavoriteFriendsViewController: UIViewController {
	var interactor: IMyFavoriteFriendsInteractor?
	var router: IMyFavoriteFriendsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension MyFavoriteFriendsViewController: IMyFavoriteFriendsViewController {
	// do someting...
}

extension MyFavoriteFriendsViewController {
	// do someting...
}

extension MyFavoriteFriendsViewController {
	// do someting...
}
