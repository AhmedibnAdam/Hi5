//
//  ProfileInteractor.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IProfileInteractor: class {
	var parameters: [String: Any]? { get set }
}

class ProfileInteractor: IProfileInteractor {
    var presenter: IProfilePresenter?
    var manager: IProfileManager?
    var parameters: [String: Any]?

    init(presenter: IProfilePresenter, manager: IProfileManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
