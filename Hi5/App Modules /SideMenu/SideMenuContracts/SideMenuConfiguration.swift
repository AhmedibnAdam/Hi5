//
//  SideMenuConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class SideMenuConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = SideMenuViewController()
        let router = SideMenuRouter(view: controller)
        let presenter = SideMenuPresenter(view: controller)
        let manager = SideMenuManager()
        let interactor = SideMenuInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}