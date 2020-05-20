//
//  FilterBublicEventPresenter.swift
//  Hi5
//
//  Created by Adam on 5/19/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFilterBublicEventPresenter: class {
	 func showErrorAlert(title: String, msg: String)
      func showResponse(response: FilterModel.SuggestionFieldResponse)
      func hideIndicator()
}

class FilterBublicEventPresenter: IFilterBublicEventPresenter {	
	weak var view: IFilterBublicEventViewController?
	
	init(view: IFilterBublicEventViewController?) {
		self.view = view
	}
    func showErrorAlert(title: String, msg: String) {
           view?.showAlert(title: title, msg: msg)
       }
       func showResponse(response: FilterModel.SuggestionFieldResponse) {
           view?.showResponse(response: response)
       }
       func hideIndicator() {
           view?.hideIndicator()
       }
}
