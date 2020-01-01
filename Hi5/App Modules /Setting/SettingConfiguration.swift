//
//  SettingConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class SettingConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = SettingViewController()
        let router = SettingRouter(view: controller)
        let presenter = SettingPresenter(view: controller)
        let manager = SettingManager()
        let interactor = SettingInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}