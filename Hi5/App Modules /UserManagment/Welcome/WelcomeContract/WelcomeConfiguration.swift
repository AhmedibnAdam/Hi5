//
//  WelcomeConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.


import Foundation
import UIKit

class WelcomeConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = WelcomeViewController()
        let router = WelcomeRouter(view: controller)
        let presenter = WelcomePresenter(view: controller)
        let manager = WelcomeManager()
        let interactor = WelcomeInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
