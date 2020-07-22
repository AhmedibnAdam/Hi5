//
//  NewPasswordConfiguration.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import Foundation
import UIKit

class NewPasswordConfiguration {
    static func setup(parameters: [String: Any] = [:], phone: String) -> UIViewController {
        let controller = NewPasswordViewController()
        controller.phone = phone
        let router = NewPasswordRouter(view: controller)
        let presenter = NewPasswordPresenter(view: controller)
        let manager = NewPasswordManager()
        let interactor = NewPasswordInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
