//
//  ForgetEmailPresenter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import UIKit

protocol IForgetEmailPresenter: class {
    func showErrorAlert(title: String, msg: String)
    func navigateToEmailVerification()
}

class ForgetEmailPresenter: IForgetEmailPresenter {	
	weak var view: IForgetEmailViewController?
	
	init(view: IForgetEmailViewController?) {
		self.view = view
	}
    
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
    
    func navigateToEmailVerification() {
        view?.navigateToEmailVerification()
    }
}
