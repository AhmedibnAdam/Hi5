//
//  TransactionsViewController.swift
//  Hi5
//
//  Created by Adam on 1/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ITransactionsViewController: class {
	var router: ITransactionsRouter? { get set }
}

class TransactionsViewController: UIViewController {
	var interactor: ITransactionsInteractor?
	var router: ITransactionsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension TransactionsViewController: ITransactionsViewController {
	// do someting...
}

extension TransactionsViewController {
	// do someting...
}

extension TransactionsViewController {
	// do someting...
}
