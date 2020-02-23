//
//  RegisterInteractor.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IRegisterInteractor: class {
    var parameters: [String: Any]? { get set }
    func doSignup(view : UIViewController , fullName: String , phoneNumber: String)
}

class RegisterInteractor: IRegisterInteractor {

    var presenter: IRegisterPresenter?
    var manager: IRegisterManager?
    var parameters: [String: Any]?
    init(presenter: IRegisterPresenter, manager: IRegisterManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func doSignup(view: UIViewController, fullName: String, phoneNumber: String) {
        manager?.signupFromApi(fullName: fullName, phoneNumber: phoneNumber, complition: { (error, succes) in
            if (succes == true) {
                self.presenter?.hideIndicator()
                self.presenter?.navigateToSignupPhoneVerification()
            } else {
                self.presenter?.hideIndicator()
                self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
            }
        })
    }
}
