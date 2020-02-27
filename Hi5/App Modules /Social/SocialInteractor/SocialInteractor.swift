//
//  SocialInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/11/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISocialInteractor: class {
	var parameters: [String: Any]? { get set }
}

class SocialInteractor: ISocialInteractor {
    var presenter: ISocialPresenter?
    var manager: ISocialManager?
    var parameters: [String: Any]?

    init(presenter: ISocialPresenter, manager: ISocialManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
