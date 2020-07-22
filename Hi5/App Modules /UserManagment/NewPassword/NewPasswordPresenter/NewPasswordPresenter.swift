//
//  NewPasswordPresenter.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import UIKit

protocol INewPasswordPresenter: class {
	func hideIndicator()
}

class NewPasswordPresenter: INewPasswordPresenter {	
	weak var view: INewPasswordViewController?
	
	init(view: INewPasswordViewController?) {
		self.view = view
	}
    func hideIndicator() {
        view?.hideIndicator()
    }
}
