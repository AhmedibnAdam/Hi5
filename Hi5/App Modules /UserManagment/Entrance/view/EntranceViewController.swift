//
//  EntranceViewController.swift
//  Hi5
//
//  Created by Adam on 7/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IEntranceViewController: class {
	var router: IEntranceRouter? { get set }
}

class EntranceViewController: UIViewController {
	var interactor: IEntranceInteractor?
	var router: IEntranceRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
    
    @IBAction func login(_ sender: UIButton) {
        router?.navigateToLogin()
    }
    
    @IBAction func register(_ sender: UIButton) {
        router?.NavigateToRegister()
    }
    
}


extension EntranceViewController: IEntranceViewController {
	// do someting...
}

extension EntranceViewController {
	// do someting...
}

extension EntranceViewController {
	// do someting...
}
