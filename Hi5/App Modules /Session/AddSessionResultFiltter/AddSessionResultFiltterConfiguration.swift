//
//  AddSessionResultFiltterConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class AddSessionResultFiltterConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = AddSessionResultFiltterViewController()
        let router = AddSessionResultFiltterRouter(view: controller)
        let presenter = AddSessionResultFiltterPresenter(view: controller)
        let manager = AddSessionResultFiltterManager()
        let interactor = AddSessionResultFiltterInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}