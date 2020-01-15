//
//  SignupPhoneVerificationInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISignupPhoneVerificationInteractor: class {
	var parameters: [String: Any]? { get set }
    func doSignupPhoneVerification(view : UIViewController , code: String)
    func doSignupResendVerificationCode(view : UIViewController)
}

class SignupPhoneVerificationInteractor: ISignupPhoneVerificationInteractor {
    var presenter: ISignupPhoneVerificationPresenter?
    var manager: ISignupPhoneVerificationManager?
    var parameters: [String: Any]?

    init(presenter: ISignupPhoneVerificationPresenter, manager: ISignupPhoneVerificationManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func doSignupPhoneVerification(view: UIViewController, code: String) {
        manager?.signupPhoneVerificationFromApi(code: code, complition: { (error, succes) in
            if (succes == true) {
                self.presenter?.navigateToCreatePassword()
            } else {
                self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
            }
        })
    }
    
    func doSignupResendVerificationCode(view: UIViewController) {
        manager?.signupResendVerificationCodeFromApi(complition: { (error, succes) in
            if (succes == true) {
                print("Done......")
            } else {
                self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
            }
        })
    }
}
