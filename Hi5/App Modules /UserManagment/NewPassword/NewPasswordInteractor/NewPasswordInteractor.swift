//
//  NewPasswordInteractor.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import UIKit

protocol INewPasswordInteractor: class {
	var parameters: [String: Any]? { get set }
    func addNewPassword()
}

class NewPasswordInteractor: INewPasswordInteractor {
    var presenter: INewPasswordPresenter?
    var manager: INewPasswordManager?
    var parameters: [String: Any]?

    init(presenter: INewPasswordPresenter, manager: INewPasswordManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func addNewPassword(){
        guard let param = parameters else {
            return
        }
        manager?.resetPasswordFromApi(parameters: param, complition: { (error, success) in
            if success {
                self.presenter?.hideIndicator()
            }
            else {
                print("error")
            }
        })
    }
}
