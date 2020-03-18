//
//  TabBarConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/19/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class TabBarConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UITabBarController {
        let controller = TabBarViewController()
        let router = TabBarRouter(view: controller)
        let presenter = TabBarPresenter(view: controller)
        let manager = TabBarManager()
        let interactor = TabBarInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
