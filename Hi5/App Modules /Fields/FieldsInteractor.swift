//
//  FieldsInteractor.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFieldsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class FieldsInteractor: IFieldsInteractor {
    var presenter: IFieldsPresenter?
    var manager: IFieldsManager?
    var parameters: [String: Any]?

    init(presenter: IFieldsPresenter, manager: IFieldsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
