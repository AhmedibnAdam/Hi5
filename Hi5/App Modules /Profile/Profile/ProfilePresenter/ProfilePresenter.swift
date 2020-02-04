//
//  ProfilePresenter.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IProfilePresenter: class {
   func showErrorAlert(title: String, msg: String)
   func hideIndecator()
}

class ProfilePresenter: IProfilePresenter {	
	weak var view: IProfileViewController?
	
	init(view: IProfileViewController?) {
		self.view = view
	}
    func showErrorAlert(title: String, msg: String){
        view?.showAlert(title: title, msg: msg)
    }
    func hideIndecator() {
        view?.hideIndecator()
    }
}
