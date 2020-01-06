//
//  MemberOfFriendsViewController.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMemberOfFriendsViewController: class {
	var router: IMemberOfFriendsRouter? { get set }
}

class MemberOfFriendsViewController: UIViewController {
	var interactor: IMemberOfFriendsInteractor?
	var router: IMemberOfFriendsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension MemberOfFriendsViewController: IMemberOfFriendsViewController {
	// do someting...
}

extension MemberOfFriendsViewController {
	// do someting...
}

extension MemberOfFriendsViewController {
	// do someting...
}
