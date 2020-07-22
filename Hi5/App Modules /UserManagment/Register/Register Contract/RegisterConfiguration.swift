//
//  RegisterConfiguration.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import Foundation
import UIKit

class RegisterConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = RegisterViewController()
        let router = RegisterRouter(view: controller)
        let presenter = RegisterPresenter(view: controller)
        let manager = RegisterManager()
        let interactor = RegisterInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
