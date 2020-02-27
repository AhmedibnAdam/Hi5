//
//  SearchLocationInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISearchLocationInteractor: class {
	var parameters: [String: Any]? { get set }
}

class SearchLocationInteractor: ISearchLocationInteractor {
    var presenter: ISearchLocationPresenter?
    var manager: ISearchLocationManager?
    var parameters: [String: Any]?

    init(presenter: ISearchLocationPresenter, manager: ISearchLocationManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
