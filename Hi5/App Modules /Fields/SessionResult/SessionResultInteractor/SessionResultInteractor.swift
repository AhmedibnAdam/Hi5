//
//  SessionResultInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/4/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISessionResultInteractor: class {
	var parameters: [String: Any]? { get set }
}

class SessionResultInteractor: ISessionResultInteractor {
    var presenter: ISessionResultPresenter?
    var manager: ISessionResultManager?
    var parameters: [String: Any]?

    init(presenter: ISessionResultPresenter, manager: ISessionResultManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
