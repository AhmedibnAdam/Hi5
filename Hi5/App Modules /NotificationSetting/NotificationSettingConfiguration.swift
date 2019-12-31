//
//  NotificationSettingConfiguration.swift
//  Hi5
//
//  Created by Adam on 12/31/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class NotificationSettingConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = NotificationSettingViewController()
        let router = NotificationSettingRouter(view: controller)
        let presenter = NotificationSettingPresenter(view: controller)
        let manager = NotificationSettingManager()
        let interactor = NotificationSettingInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}