//
//  ChangeUsernameInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IChangeUsernameInteractor: class {
	var parameters: [String: Any]? { get set }
}

class ChangeUsernameInteractor: IChangeUsernameInteractor {
    var presenter: IChangeUsernamePresenter?
    var manager: IChangeUsernameManager?
    var parameters: [String: Any]?

    init(presenter: IChangeUsernamePresenter, manager: IChangeUsernameManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
