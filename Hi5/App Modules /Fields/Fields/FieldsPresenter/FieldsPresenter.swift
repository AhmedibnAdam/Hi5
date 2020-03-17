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
    func showFavorites(response: FieldsModel.FavoriteFieldsResponse)
    func showMemberFields(response: FieldsModel.MemberShipFieldsResponse)
    func removeNoMemberFields()
    func showNoMemberOfFields()
    func removeNoFavouriteFields()
    func showNoFavouriteFields()
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
    func showFavorites(response: FieldsModel.FavoriteFieldsResponse) {
        view?.showFavorites(response: response)
    }
    func showMemberFields(response: FieldsModel.MemberShipFieldsResponse) {
        view?.showMemberFields(response: response)
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
    
}
