//
//  ChangeUsernameConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class ChangeUsernameConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = ChangeUsernameViewController()
        let router = ChangeUsernameRouter(view: controller)
        let presenter = ChangeUsernamePresenter(view: controller)
        let manager = ChangeUsernameManager()
        let interactor = ChangeUsernameInteractor(presenter: presenter, manager: manager)
        
        controller.parameters = parameters
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
