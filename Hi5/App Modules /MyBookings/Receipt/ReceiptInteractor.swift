//
//  ReceiptInteractor.swift
//  Hi5
//
//  Created by Adam on 7/29/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IReceiptInteractor: class {
	var parameters: [String: Any]? { get set }
}

class ReceiptInteractor: IReceiptInteractor {
    var presenter: IReceiptPresenter?
    var worker: IReceiptWorker?
    var parameters: [String: Any]?

    init(presenter: IReceiptPresenter, worker: IReceiptWorker) {
    	self.presenter = presenter
    	self.worker = worker
    }
}
