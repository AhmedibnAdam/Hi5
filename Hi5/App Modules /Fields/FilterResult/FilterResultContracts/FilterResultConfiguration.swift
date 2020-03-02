//
//  FilterResultConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/26/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class FilterResultConfiguration {
    static func setup(parameters: [String: Any] = [:] , param: [String: Any]) -> UIViewController {
        let controller = FilterResultViewController()
        controller.parameter = param
        let router = FilterResultRouter(view: controller)
        let presenter = FilterResultPresenter(view: controller)
        let manager = FilterResultManager()
        let interactor = FilterResultInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
