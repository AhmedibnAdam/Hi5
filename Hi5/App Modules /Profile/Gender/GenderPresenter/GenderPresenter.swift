//
//  GenderPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/21/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IGenderPresenter: class {
    func showErrorAlert(title: String, msg: String)
	func hideIndicator()
    func navigateToEditProfile()
}

class GenderPresenter: IGenderPresenter {	
	weak var view: IGenderViewController?
	
	init(view: IGenderViewController?) {
		self.view = view
	}
    func hideIndicator() {
        view?.hideIndicator()
    }
    func navigateToEditProfile() {
        view?.navigateToEditProfile()
    }
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
}
