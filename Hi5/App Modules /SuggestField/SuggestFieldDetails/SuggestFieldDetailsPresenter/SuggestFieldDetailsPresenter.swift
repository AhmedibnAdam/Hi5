//
//  SuggestFieldDetailsPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISuggestFieldDetailsPresenter: class {
    func showErrorAlert(title: String, msg: String)
    func showResponse(response: SuggestFieldDetailsModel.SuggestFieldDataResponse)
    func removeLoadingIndicator()
}

class SuggestFieldDetailsPresenter: ISuggestFieldDetailsPresenter {
	weak var view: ISuggestFieldDetailsViewController?
	
	init(view: ISuggestFieldDetailsViewController?) {
		self.view = view
	}
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
    func showResponse(response: SuggestFieldDetailsModel.SuggestFieldDataResponse) {
        view?.showResponse(response: response)
    }
    func removeLoadingIndicator() {
        view?.removeLoadingIndicator()
    }
}
