//
//  PublicEventsPresenter.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPublicEventsPresenter: class {
	func showErrorAlert(title: String, msg: String)
    func showFilteresPublicEvent(response: PublicEventsModel.PublicEventResponse)
}

class PublicEventsPresenter: IPublicEventsPresenter {

	weak var view: IPublicEventsViewController?
	
	init(view: IPublicEventsViewController?) {
		self.view = view
	}
    func showErrorAlert(title: String, msg: String) {
          view?.showAlert(title: title, msg: msg)
      }
    func showFilteresPublicEvent(response: PublicEventsModel.PublicEventResponse) {
        view?.showFilteresPublicEvent(response: response)
    }
    
}
