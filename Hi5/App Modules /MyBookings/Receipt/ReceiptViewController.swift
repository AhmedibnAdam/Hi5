//
//  ReceiptViewController.swift
//  Hi5
//
//  Created by Adam on 7/29/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IReceiptViewController: class {
	var router: IReceiptRouter? { get set }
}

class ReceiptViewController: UIViewController {
	var interactor: IReceiptInteractor?
	var router: IReceiptRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension ReceiptViewController: IReceiptViewController {
	// do someting...
}

extension ReceiptViewController {
	// do someting...
}

extension ReceiptViewController {
	// do someting...
}
