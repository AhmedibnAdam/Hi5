//
//  EditProfileInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/20/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IEditProfileInteractor: class {
	var parameters: [String: Any]? { get set }
}

class EditProfileInteractor: IEditProfileInteractor {
    var presenter: IEditProfilePresenter?
    var manager: IEditProfileManager?
    var parameters: [String: Any]?

    init(presenter: IEditProfilePresenter, manager: IEditProfileManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
