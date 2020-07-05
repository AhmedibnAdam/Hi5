//
//  FieldOwnerDetailsPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFieldOwnerDetailsPresenter: class {
	func showAlert(title: String, msg: String)
}

class FieldOwnerDetailsPresenter: IFieldOwnerDetailsPresenter {	
	weak var view: IFieldOwnerDetailsViewController?
	
	init(view: IFieldOwnerDetailsViewController?) {
		self.view = view
	}
    func showAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
}
