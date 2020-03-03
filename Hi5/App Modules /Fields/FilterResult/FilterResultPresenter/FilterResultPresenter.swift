//
//  FilterResultPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/26/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFilterResultPresenter: class {
    func showResponse(response: FilterResultModel.FilterSessionResponse)
    func hideIndicator()
    func showErrorAlert(title: String, msg: String)
    func showTableView()
    func hideTableView()
}

class FilterResultPresenter: IFilterResultPresenter {	
	weak var view: IFilterResultViewController?
	
	init(view: IFilterResultViewController?) {
		self.view = view
	}
    func showResponse(response: FilterResultModel.FilterSessionResponse) {
        view?.showResponse(response: response)
    }
    func hideIndicator() {
        view?.hideIndicator()
    }
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
    func showTableView() {
        view?.showTableView()
    }
    func hideTableView() {
        view?.hideTableView()
    }
}
