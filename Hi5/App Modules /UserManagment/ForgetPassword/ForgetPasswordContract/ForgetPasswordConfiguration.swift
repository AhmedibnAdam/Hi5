//
//  ForgetPasswordConfiguration.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import Foundation
import UIKit

class ForgetPasswordConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = ForgetPasswordViewController()
        let router = ForgetPasswordRouter(view: controller)
        let presenter = ForgetPasswordPresenter(view: controller)
        let manager = ForgetPasswordManager()
        let interactor = ForgetPasswordInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
