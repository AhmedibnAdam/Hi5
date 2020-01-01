//
//  SettingInteractor.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISettingInteractor: class {
	var parameters: [String: Any]? { get set }
}

class SettingInteractor: ISettingInteractor {
    var presenter: ISettingPresenter?
    var manager: ISettingManager?
    var parameters: [String: Any]?

    init(presenter: ISettingPresenter, manager: ISettingManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
