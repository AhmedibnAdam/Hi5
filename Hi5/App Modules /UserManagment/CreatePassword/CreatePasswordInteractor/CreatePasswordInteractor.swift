//
//  CreatePasswordInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.


import UIKit

protocol ICreatePasswordInteractor: class {
	var parameters: [String: Any]? { get set }
    func doCreatePassword()
}

class CreatePasswordInteractor: ICreatePasswordInteractor {

    var presenter: ICreatePasswordPresenter?
    var manager: ICreatePasswordManager?
    var parameters: [String: Any]?

    init(presenter: ICreatePasswordPresenter, manager: ICreatePasswordManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func doCreatePassword() {
        manager?.createPasswordFromApi(parameters: parameters, complition: { (error , success) in
            if (success == true) {
                self.presenter?.hideIndicator()
                self.presenter?.navigateToProfile()
            } else {
                self.presenter?.hideIndicator()
                self.presenter?.showErrorAlert(title: "Alert", msg: "Password should be 8  characters at least")
            }
            
        })
        
    }
}
