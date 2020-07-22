//
//  EmailVerficationInteractor.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import UIKit

protocol IEmailVerficationInteractor: class {
	var parameters: [String: Any]? { get set }
}

class EmailVerficationInteractor: IEmailVerficationInteractor {
    var presenter: IEmailVerficationPresenter?
    var manager: IEmailVerficationManager?
    var parameters: [String: Any]?

    init(presenter: IEmailVerficationPresenter, manager: IEmailVerficationManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
