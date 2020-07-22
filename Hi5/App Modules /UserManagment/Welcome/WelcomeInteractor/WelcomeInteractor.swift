//
//  WelcomeInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.


import UIKit

protocol IWelcomeInteractor: class {
	var parameters: [String: Any]? { get set }
}

class WelcomeInteractor: IWelcomeInteractor {
    var presenter: IWelcomePresenter?
    var manager: IWelcomeManager?
    var parameters: [String: Any]?

    init(presenter: IWelcomePresenter, manager: IWelcomeManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
