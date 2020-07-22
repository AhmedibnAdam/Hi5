//
//  ForgotPhoneConfiguration.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import Foundation
import UIKit

class ForgotPhoneConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = ForgotPhoneViewController()
        let router = ForgotPhoneRouter(view: controller)
        let presenter = ForgotPhonePresenter(view: controller)
        let manager = ForgotPhoneManager()
        let interactor = ForgotPhoneInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
