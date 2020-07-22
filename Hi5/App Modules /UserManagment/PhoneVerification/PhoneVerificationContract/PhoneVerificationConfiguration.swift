//
//  PhoneVerificationConfiguration.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import Foundation
import UIKit

class PhoneVerificationConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = PhoneVerificationViewController()
        let router = PhoneVerificationRouter(view: controller)
        let presenter = PhoneVerificationPresenter(view: controller)
        let manager = PhoneVerificationManager()
        let interactor = PhoneVerificationInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
