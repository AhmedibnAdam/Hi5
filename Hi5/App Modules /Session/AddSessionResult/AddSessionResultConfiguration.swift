//
//  AddSessionResultConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class AddSessionResultConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = AddSessionResultViewController()
        let router = AddSessionResultRouter(view: controller)
        let presenter = AddSessionResultPresenter(view: controller)
        let manager = AddSessionResultManager()
        let interactor = AddSessionResultInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}