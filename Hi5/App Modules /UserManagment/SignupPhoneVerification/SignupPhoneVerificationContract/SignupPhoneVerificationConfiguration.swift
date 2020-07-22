//
//  SignupPhoneVerificationConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.


import Foundation
import UIKit

class SignupPhoneVerificationConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = SignupPhoneVerificationViewController()
        let router = SignupPhoneVerificationRouter(view: controller)
        let presenter = SignupPhoneVerificationPresenter(view: controller)
        let manager = SignupPhoneVerificationManager()
        let interactor = SignupPhoneVerificationInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
