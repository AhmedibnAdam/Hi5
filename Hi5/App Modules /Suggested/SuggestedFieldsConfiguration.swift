//
//  SuggestedFieldsConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class SuggestedFieldsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = SuggestedFieldsViewController()
        let router = SuggestedFieldsRouter(view: controller)
        let presenter = SuggestedFieldsPresenter(view: controller)
        let manager = SuggestedFieldsManager()
        let interactor = SuggestedFieldsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}