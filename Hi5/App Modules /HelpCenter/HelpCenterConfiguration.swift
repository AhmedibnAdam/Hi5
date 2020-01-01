//
//  HelpCenterConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class HelpCenterConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = HelpCenterViewController()
        let router = HelpCenterRouter(view: controller)
        let presenter = HelpCenterPresenter(view: controller)
        let manager = HelpCenterManager()
        let interactor = HelpCenterInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}