//
//  FilterBublicEventInteractor.swift
//  Hi5
//
//  Created by Adam on 5/19/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFilterBublicEventInteractor: class {
	var parameters: [String: Any]? { get set }
    func filterEvent()
}

class FilterBublicEventInteractor: IFilterBublicEventInteractor {
    var presenter: IFilterBublicEventPresenter?
    var manager: IFilterBublicEventManager?
    var parameters: [String: Any]?

    init(presenter: IFilterBublicEventPresenter, manager: IFilterBublicEventManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func filterEvent() {
        manager?.filterEventFromApi(complition: { (error, success, response) in
            if (success == true) {
                if let resp = response {
                    self.presenter?.hideIndicator()
                    self.presenter?.showResponse(response: resp)
                }
            } else {
                self.presenter?.hideIndicator()
                self.presenter?.showErrorAlert(title: "Error", msg: "SomeThing Wrong")
            }
        })
    }
}
