//
//  HelpCenterInteractor.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IHelpCenterInteractor: class {
	var parameters: [String: Any]? { get set }
}

class HelpCenterInteractor: IHelpCenterInteractor {
    var presenter: IHelpCenterPresenter?
    var manager: IHelpCenterManager?
    var parameters: [String: Any]?

    init(presenter: IHelpCenterPresenter, manager: IHelpCenterManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
