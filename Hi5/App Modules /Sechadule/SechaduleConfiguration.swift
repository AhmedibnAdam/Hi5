//
//  SechaduleConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/14/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class SechaduleConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = SechaduleViewController()
        let router = SechaduleRouter(view: controller)
        let presenter = SechadulePresenter(view: controller)
        let manager = SechaduleManager()
        let interactor = SechaduleInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}