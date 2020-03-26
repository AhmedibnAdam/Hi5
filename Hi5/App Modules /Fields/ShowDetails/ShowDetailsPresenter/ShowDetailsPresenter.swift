//
//  ShowDetailsPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IShowDetailsPresenter: class {
    func showErrorAlert(title: String, msg: String)
    func showDetailsResponse(response: ShowDetailsModel.FieldDetails)
}

class ShowDetailsPresenter: IShowDetailsPresenter {
	weak var view: IShowDetailsViewController?
	
	init(view: IShowDetailsViewController?) {
		self.view = view
	}
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
    func showDetailsResponse(response: ShowDetailsModel.FieldDetails) {
        view?.showDetailsResponse(response: response)
    }
}
