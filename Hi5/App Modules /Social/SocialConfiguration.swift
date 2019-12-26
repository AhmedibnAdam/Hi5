//
//  SocialConfiguration.swift
//  Hi5
//
//  Created by Adam on 12/23/19.
//  Copyright (c) 2019 Fudex. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class SocialConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = SocialViewController()
        let router = SocialRouter(view: controller)
        let presenter = SocialPresenter(view: controller)
        let manager = SocialManager()
        let interactor = SocialInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}