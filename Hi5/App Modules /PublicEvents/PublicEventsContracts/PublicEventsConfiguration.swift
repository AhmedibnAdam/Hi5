//
//  PublicEventsConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class PublicEventsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = PublicEventsViewController()
        let router = PublicEventsRouter(view: controller)
        let presenter = PublicEventsPresenter(view: controller)
        let manager = PublicEventsManager()
        let interactor = PublicEventsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}