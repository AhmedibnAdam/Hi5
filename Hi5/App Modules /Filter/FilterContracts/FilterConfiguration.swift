//
//  FilterConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class FilterConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = FilterViewController()
        let router = FilterRouter(view: controller)
        let presenter = FilterPresenter(view: controller)
        let manager = FilterManager()
        let interactor = FilterInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}