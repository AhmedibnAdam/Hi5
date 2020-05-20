//
//  FilterBublicEventConfiguration.swift
//  Hi5
//
//  Created by Adam on 5/19/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class FilterBublicEventConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = FilterBublicEventViewController()
        controller.param = parameters
        let router = FilterBublicEventRouter(view: controller)
        let presenter = FilterBublicEventPresenter(view: controller)
        let manager = FilterBublicEventManager()
        let interactor = FilterBublicEventInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
