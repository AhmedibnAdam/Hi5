//
//  ChangeUsernamePresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IChangeUsernamePresenter: class {
	func showErrorAlert(title: String, msg: String)
    func navigateToCreatePassword()
}

class ChangeUsernamePresenter: IChangeUsernamePresenter {	
	weak var view: IChangeUsernameViewController?
	
	init(view: IChangeUsernameViewController?) {
		self.view = view
	}
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
    func navigateToCreatePassword() {
        view?.navigateToCreatePassword()
    }
}
