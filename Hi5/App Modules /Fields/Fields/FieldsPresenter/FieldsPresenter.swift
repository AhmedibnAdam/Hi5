//
//  FieldsPresenter.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFieldsPresenter: class {
    func showErrorAlert(title: String, msg: String)
    func showNearByResponse(response: FieldsModel.NearByfieldsResponse)
}

class FieldsPresenter: IFieldsPresenter {	
	weak var view: IFieldsViewController?
	
	init(view: IFieldsViewController?) {
		self.view = view
	}
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
    func showNearByResponse(response: FieldsModel.NearByfieldsResponse) {
        view?.showNearByResponse(response: response)
    }
}
