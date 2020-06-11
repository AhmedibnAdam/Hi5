//
//  SessionDetailsPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/5/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISessionDetailsPresenter: class {
    func showErrorAlert(title: String, msg: String)
    func showResponse(response: SessionDetailsModel.SessionDetailsResponse)
    func showResponseForContacts(response: SessionDetailsModel.FieldContactsResponse)
}

class SessionDetailsPresenter: ISessionDetailsPresenter {	
	weak var view: ISessionDetailsViewController?
	
	init(view: ISessionDetailsViewController?) {
		self.view = view
	}
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
    func showResponse(response: SessionDetailsModel.SessionDetailsResponse){
        view?.showResponse(response: response)
    }
    func showResponseForContacts(response: SessionDetailsModel.FieldContactsResponse) {
        view?.showResponseFromContacts(response: response)
    }
}
