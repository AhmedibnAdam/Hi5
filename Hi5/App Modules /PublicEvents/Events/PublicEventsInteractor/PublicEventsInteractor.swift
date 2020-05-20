//
//  PublicEventsInteractor.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPublicEventsInteractor: class {
	var parameters: [String: Any]? { get set }
    func filterPublicEvent(view : UIViewController)
    func searchPublicEvent()
}

class PublicEventsInteractor: IPublicEventsInteractor {
    
    var presenter: IPublicEventsPresenter?
    var manager: IPublicEventsManager?
    var parameters: [String: Any]?

    init(presenter: IPublicEventsPresenter, manager: IPublicEventsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func filterPublicEvent(view: UIViewController) {
        manager?.requestFilteredPublicEventFromApi(parameters: parameters!, complition: { (error, success, response) in
             if (success == true) {
                guard let response = response else {return}
                 self.presenter?.showFilteresPublicEvent(response: response)
             
              } else {
                self.presenter?.showErrorAlert(title: "Sorry!", msg: (error?.message ?? "No Events Found"))
              }
        })
    }
    func searchPublicEvent() {
        manager?.requestSearchPublicEventFromApi(parameters: parameters!, complition: { (error, success, response) in
             if (success == true) {
                guard let response = response else {return}
                 self.presenter?.showFilteresPublicEvent(response: response)
             
              } else {
                self.presenter?.showErrorAlert(title: "Sorry!", msg: (error?.msg ?? "No Events Found"))
              }
        })
    }

    
}
