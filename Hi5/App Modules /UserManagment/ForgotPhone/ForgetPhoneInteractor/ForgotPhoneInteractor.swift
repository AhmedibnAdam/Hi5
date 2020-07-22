//
//  ForgotPhoneInteractor.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import UIKit

protocol IForgotPhoneInteractor: class {
	var parameters: [String: Any]? { get set }
}

class ForgotPhoneInteractor: IForgotPhoneInteractor {
    var presenter: IForgotPhonePresenter?
    var manager: IForgotPhoneManager?
    var parameters: [String: Any]?

    init(presenter: IForgotPhonePresenter, manager: IForgotPhoneManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
