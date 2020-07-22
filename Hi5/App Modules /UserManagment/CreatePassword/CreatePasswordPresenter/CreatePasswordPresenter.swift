//
//  CreatePasswordPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.


import UIKit

protocol ICreatePasswordPresenter: class {
	func showErrorAlert(title: String, msg: String)
    func navigateToProfile()
    func hideIndicator()
}

class CreatePasswordPresenter: ICreatePasswordPresenter {
    
	weak var view: ICreatePasswordViewController?
	
	init(view: ICreatePasswordViewController?) {
		self.view = view
	}
    
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
    
    func navigateToProfile() {
        view?.navigateToProfile()
    }
    
    func hideIndicator() {
        view?.hideIndicator()
    }
}
