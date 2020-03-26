//
//  ShowDetailsConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class ShowDetailsConfiguration {
    static func setup(parameters: [String: Any] = [:] , field: String) -> UIViewController {
        let controller = ShowDetailsViewController()
        controller.field_id = field
        let router = ShowDetailsRouter(view: controller)
        let presenter = ShowDetailsPresenter(view: controller)
        let manager = ShowDetailsManager()
        let interactor = ShowDetailsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
