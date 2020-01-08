//
//  UserAccountConfiguration.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class UserAccountConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = UserAccountViewController()
        let router = UserAccountRouter(view: controller)
        let presenter = UserAccountPresenter(view: controller)
        let manager = UserAccountManager()
        let interactor = UserAccountInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}