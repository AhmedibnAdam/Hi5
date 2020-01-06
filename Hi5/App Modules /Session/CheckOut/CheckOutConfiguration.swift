//
//  CheckOutConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class CheckOutConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = CheckOutViewController()
        let router = CheckOutRouter(view: controller)
        let presenter = CheckOutPresenter(view: controller)
        let manager = CheckOutManager()
        let interactor = CheckOutInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}