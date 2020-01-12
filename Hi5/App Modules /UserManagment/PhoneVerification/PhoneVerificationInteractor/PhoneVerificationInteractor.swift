//
//  PhoneVerificationInteractor.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPhoneVerificationInteractor: class {
	var parameters: [String: Any]? { get set }
}

class PhoneVerificationInteractor: IPhoneVerificationInteractor {
    var presenter: IPhoneVerificationPresenter?
    var manager: IPhoneVerificationManager?
    var parameters: [String: Any]?

    init(presenter: IPhoneVerificationPresenter, manager: IPhoneVerificationManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
