//
//  GenderInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/21/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IGenderInteractor: class {
	var parameters: [String: Any]? { get set }
}

class GenderInteractor: IGenderInteractor {
    var presenter: IGenderPresenter?
    var manager: IGenderManager?
    var parameters: [String: Any]?

    init(presenter: IGenderPresenter, manager: IGenderManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
