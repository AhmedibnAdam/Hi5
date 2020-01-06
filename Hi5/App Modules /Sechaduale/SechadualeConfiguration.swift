//
//  SechadualeConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class SechadualeConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = SechadualeViewController()
        let router = SechadualeRouter(view: controller)
        let presenter = SechadualePresenter(view: controller)
        let manager = SechadualeManager()
        let interactor = SechadualeInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}