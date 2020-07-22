//
//  MyEventDetailsInteractor.swift
//  Hi5
//
//  Created by Adam on 7/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IMyEventDetailsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class MyEventDetailsInteractor: IMyEventDetailsInteractor {
    var presenter: IMyEventDetailsPresenter?
    var worker: IMyEventDetailsWorker?
    var parameters: [String: Any]?

    init(presenter: IMyEventDetailsPresenter, worker: IMyEventDetailsWorker) {
    	self.presenter = presenter
    	self.worker = worker
    }
}
