//
//  PublicEventDetailsInteractor.swift
//  Hi5
//
//  Created by Adam on 4/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPublicEventDetailsInteractor: class {
	var parameters: [String: Any]? { get set }
     func showDetails(view: UIViewController , eventId: String)
}

class PublicEventDetailsInteractor: IPublicEventDetailsInteractor {
 
    var presenter: IPublicEventDetailsPresenter?
    var manager: IPublicEventDetailsManager?
    var parameters: [String: Any]?

    init(presenter: IPublicEventDetailsPresenter, manager: IPublicEventDetailsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func showDetails(view: UIViewController, eventId fieldId: String) {
        manager?.showDetailsFromApi(id: fieldId, complition: { (error, success, response) in
            if (success == true){
                guard let response = response else {return}
                self.presenter?.showDetailsResponse(response: response)
            } else {
                self.presenter?.showErrorAlert(title: "Error", msg: "SomeThing Wrong")
            }
        })
    }
     
}
