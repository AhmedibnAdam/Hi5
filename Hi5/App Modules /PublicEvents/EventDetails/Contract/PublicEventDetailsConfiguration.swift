//
//  PublicEventDetailsConfiguration.swift
//  Hi5
//
//  Created by Adam on 4/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class PublicEventDetailsConfiguration {
    static func setup(parameters: [String: Any] = [:] , field_id: String) -> UIViewController {
        let controller = PublicEventDetailsViewController()
        controller.field_id = field_id
        let router = PublicEventDetailsRouter(view: controller)
        let presenter = PublicEventDetailsPresenter(view: controller)
        let manager = PublicEventDetailsManager()
        let interactor = PublicEventDetailsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
