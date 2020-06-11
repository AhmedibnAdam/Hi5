//
//  SessionDetailsInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/5/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISessionDetailsInteractor: class {
	var parameters: [String: Any]? { get set }
    func sessionDetails(view : UIViewController , fieldId: Int , payment: String)
    func fieldContacts(view: UIViewController , id: Int)
}

class SessionDetailsInteractor: ISessionDetailsInteractor {
    var presenter: ISessionDetailsPresenter?
    var manager: ISessionDetailsManager?
    var parameters: [String: Any]?

    init(presenter: ISessionDetailsPresenter, manager: ISessionDetailsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func sessionDetails(view: UIViewController, fieldId: Int, payment: String) {
        manager?.sessionDetailsFromApi(fieldId: fieldId, payment: payment, complition: { (error, success, response) in
            if (success == true) {
                guard let response = response else {return}
                if (response.status == true){
                    self.presenter?.showResponse(response: response)
                } else {
                    self.presenter?.showErrorAlert(title: "Error", msg: "SomeThing Wrong")
                }
            } else {
                self.presenter?.showErrorAlert(title: "Error", msg: "SomeThing Wrong")
            }
        })
    }
    
    func fieldContacts(view: UIViewController, id: Int) {
        manager?.fieldContactsFromApi(id: id, complition: { (error, success, response) in
            if(success == true){
                guard let response = response else {return}
                if(response.status == true){
                    self.presenter?.showResponseForContacts(response: response)
                } else {
                    self.presenter?.showErrorAlert(title: "Error", msg: "SomeThing Wrong")
                }
            } else {
                self.presenter?.showErrorAlert(title: "Error", msg: "SomeThing Wrong")
            }
        })
    }
}
