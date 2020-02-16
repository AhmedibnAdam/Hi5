//
//  SechaduleInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/14/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISechaduleInteractor: class {
	var parameters: [String: Any]? { get set }
}

class SechaduleInteractor: ISechaduleInteractor {
    var presenter: ISechadulePresenter?
    var manager: ISechaduleManager?
    var parameters: [String: Any]?

    init(presenter: ISechadulePresenter, manager: ISechaduleManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
