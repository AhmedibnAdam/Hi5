//
//  SessionResultInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/4/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISessionResultInteractor: class {
	var parameters: [String: Any]? { get set }
    func checkAvailability(view : UIViewController , fieldId: Int , date: String)
}

class SessionResultInteractor: ISessionResultInteractor {
    var presenter: ISessionResultPresenter?
    var manager: ISessionResultManager?
    var parameters: [String: Any]?

    init(presenter: ISessionResultPresenter, manager: ISessionResultManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func checkAvailability(view: UIViewController, fieldId: Int, date: String) {
        manager?.checkAvailabilityFromApi(fieldId: fieldId, date: date, complition: { (error, success, response) in
            if (success == true){
                guard let response = response else {return}
                if (response.fields?.count != 0) {
                     self.presenter?.hideIndicator()
                     self.presenter?.removeNoFields()
                     self.presenter?.showTableView()
                     self.presenter?.showResponse(response: response)
                } else {
                    self.presenter?.hideIndicator()
                    self.presenter?.hideTableView()
                    self.presenter?.addNoFields()
                }
            } else {
                self.presenter?.hideIndicator()
                self.presenter?.hideTableView()
                self.presenter?.removeNoFields()
                self.presenter?.showErrorAlert(title: "Error", msg: "SomeThing Wrong")
            }
        })
    }
}
