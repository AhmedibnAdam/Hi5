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
}

class SignupPhoneVerificationInteractor: ISignupPhoneVerificationInteractor {
    var presenter: ISignupPhoneVerificationPresenter?
    var manager: ISignupPhoneVerificationManager?
    var parameters: [String: Any]?

    init(presenter: ISignupPhoneVerificationPresenter, manager: ISignupPhoneVerificationManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
