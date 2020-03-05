//
//  SessionResultPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/4/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISessionResultPresenter: class {
	func showErrorAlert(title: String, msg: String)
    func hideIndicator()
    func showTableView()
    func hideTableView()
    func addNoFields()
    func removeNoFields()
    func showResponse(response: SessionResultModel.SessionResultResponse)
}

class SessionResultPresenter: ISessionResultPresenter {	
	weak var view: ISessionResultViewController?
	
	init(view: ISessionResultViewController?) {
		self.view = view
	}
    func showErrorAlert(title: String, msg: String) {
        view?.showAlert(title: title, msg: msg)
    }
    func hideIndicator() {
        view?.hideIndicator()
    }
    func showTableView() {
        view?.showTableView()
    }
    func hideTableView() {
        view?.hideTableView()
    }
    func addNoFields() {
        view?.addNoFields()
    }
    func removeNoFields() {
        view?.removeNoFields()
    }
    func showResponse(response: SessionResultModel.SessionResultResponse) {
        view?.showResponse(response: response)
    }
}
