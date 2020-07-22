//
//  RegisterInteractor.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import UIKit

protocol IRegisterInteractor: class {
    var parameters: [String: Any]? { get set }
    func doSignup(view : UIViewController , fullName: String , phoneNumber: String)
    func terms()
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
//                self.presenter?.showErrorAlert(title: "\(error?.errors[0].key ?? "")", msg: (error?.errors[0].value) ?? "Error ")
            }
        })
    }
    func terms(){
        manager?.terms(complition: { (response, status) in
            if status == true {
                self.presenter?.showTerms(response: response )
            }
        })
    }
}
