//
//  TermsInteractor.swift
//  Hi5
//
//  Created by Adam on 7/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import UIKit

protocol ITermsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class TermsInteractor: ITermsInteractor {
    var presenter: ITermsPresenter?
    var worker: ITermsWorker?
    var parameters: [String: Any]?

    init(presenter: ITermsPresenter, worker: ITermsWorker) {
    	self.presenter = presenter
    	self.worker = worker
    }
}
