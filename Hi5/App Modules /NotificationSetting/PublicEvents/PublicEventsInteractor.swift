//
//  PublicEventsInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPublicEventsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class PublicEventsInteractor: IPublicEventsInteractor {
    var presenter: IPublicEventsPresenter?
    var manager: IPublicEventsManager?
    var parameters: [String: Any]?

    init(presenter: IPublicEventsPresenter, manager: IPublicEventsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
