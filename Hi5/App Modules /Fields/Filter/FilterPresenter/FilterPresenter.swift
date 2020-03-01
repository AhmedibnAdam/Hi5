//
//  FilterPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFilterPresenter: class {
   func showErrorAlert(title: String, msg: String)
   func showResponse(response: FilterModel.SuggestionFieldResponse)
}

class FilterPresenter: IFilterPresenter {	
	weak var view: IFilterViewController?
	
	init(view: IFilterViewController?) {
		self.view = view
	}
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
    func showResponse(response: FilterModel.SuggestionFieldResponse) {
        view?.showResponse(response: response)
    }
}
