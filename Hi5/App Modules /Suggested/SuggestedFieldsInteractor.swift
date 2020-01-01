//
//  SuggestedFieldsInteractor.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISuggestedFieldsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class SuggestedFieldsInteractor: ISuggestedFieldsInteractor {
    var presenter: ISuggestedFieldsPresenter?
    var manager: ISuggestedFieldsManager?
    var parameters: [String: Any]?

    init(presenter: ISuggestedFieldsPresenter, manager: ISuggestedFieldsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
