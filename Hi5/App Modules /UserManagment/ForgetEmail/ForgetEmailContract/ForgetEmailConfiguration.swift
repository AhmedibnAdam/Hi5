//
//  ForgetEmailConfiguration.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import Foundation
import UIKit

class ForgetEmailConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = ForgetEmailViewController()
        let router = ForgetEmailRouter(view: controller)
        let presenter = ForgetEmailPresenter(view: controller)
        let manager = ForgetEmailManager()
        let interactor = ForgetEmailInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
