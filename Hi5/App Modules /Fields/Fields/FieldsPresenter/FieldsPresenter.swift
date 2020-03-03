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
    func showResponse(response: FieldsModel.NearByfieldsResponse)
    func removeNoMemberFields()
    func showNoMemberOfFields()
    func removeNoFavouriteFields()
    func showNoFavouriteFields()
    func hideIndicator()
}

class FieldsPresenter: IFieldsPresenter {
	weak var view: IFieldsViewController?
	
	init(view: IFieldsViewController?) {
		self.view = view
	}
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
    func showResponse(response: FieldsModel.NearByfieldsResponse) {
        view?.showResponse(response: response)
    }
    func removeNoMemberFields() {
        view?.removeNoMemberFields()
    }
    func showNoMemberOfFields() {
        view?.showNoMemberOfFields()
    }
    func removeNoFavouriteFields(){
        view?.removeNoFavouriteFields()
    }
    func showNoFavouriteFields(){
        view?.showNoFavouriteFields()
    }
    func hideIndicator() {
        view?.hideIndicator()
    }
    
}
