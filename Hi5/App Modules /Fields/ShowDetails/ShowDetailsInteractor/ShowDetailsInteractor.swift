//
//  ShowDetailsInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IShowDetailsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class ShowDetailsInteractor: IShowDetailsInteractor {
    var presenter: IShowDetailsPresenter?
    var manager: IShowDetailsManager?
    var parameters: [String: Any]?

    init(presenter: IShowDetailsPresenter, manager: IShowDetailsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
