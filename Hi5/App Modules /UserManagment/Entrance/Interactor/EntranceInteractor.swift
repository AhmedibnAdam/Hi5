//
//  EntranceInteractor.swift
//  Hi5
//
//  Created by Adam on 7/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol IEntranceInteractor: class {
	var parameters: [String: Any]? { get set }
}

class EntranceInteractor: IEntranceInteractor {
    var presenter: IEntrancePresenter?
    var worker: IEntranceWorker?
    var parameters: [String: Any]?

    init(presenter: IEntrancePresenter, worker: IEntranceWorker) {
    	self.presenter = presenter
    	self.worker = worker
    }
}
