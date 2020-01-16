//
//  ForgetEmailInteractor.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IForgetEmailInteractor: class {
	var parameters: [String: Any]? { get set }
    func doForgetEmail(view : UIViewController , email: String)
}

class ForgetEmailInteractor: IForgetEmailInteractor {
    var presenter: IForgetEmailPresenter?
    var manager: IForgetEmailManager?
    var parameters: [String: Any]?

    init(presenter: IForgetEmailPresenter, manager: IForgetEmailManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func doForgetEmail(view: UIViewController, email: String) {
        manager?.forgetEmailFromApi(email: email, complition: { (error, success) in
            if (success == true) {
                print("Done.......")
                self.presenter?.navigateToEmailVerification()
            } else {
               self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
            }
        })
    }
}
