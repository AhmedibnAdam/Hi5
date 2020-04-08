//
//  PublicEventDetailsPresenter.swift
//  Hi5
//
//  Created by Adam on 4/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPublicEventDetailsPresenter: class {
	func showErrorAlert(title: String, msg: String)
    func showDetailsResponse(response: PublicEventDetailsModel.PublicEventDetails)
}

class PublicEventDetailsPresenter: IPublicEventDetailsPresenter {

    weak var view: IPublicEventDetailsViewController?
    init(view: IPublicEventDetailsViewController?) {
        self.view = view
    }
    
    func showDetailsResponse(response: PublicEventDetailsModel.PublicEventDetails) {
        view?.showDetailsResponse(response: response)
    }
    
    func showErrorAlert(title: String, msg: String) {
        view?.showErrorAlert(title: title, msg: msg)
    }
    
}
