//
//  SechadualeInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISechadualeInteractor: class {
	var parameters: [String: Any]? { get set }
}

class SechadualeInteractor: ISechadualeInteractor {
    var presenter: ISechadualePresenter?
    var manager: ISechadualeManager?
    var parameters: [String: Any]?

    init(presenter: ISechadualePresenter, manager: ISechadualeManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
