//
//  EditProfilePresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/20/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IEditProfilePresenter: class {
    func showErrorAlert(title: String, msg: String)
    func hideIndicator()
}

class EditProfilePresenter: IEditProfilePresenter {
	weak var view: IEditProfileViewController?
	
	init(view: IEditProfileViewController?) {
		self.view = view
	}
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
    
    func hideIndicator() {
        view?.hideIndicator()
    }
}
