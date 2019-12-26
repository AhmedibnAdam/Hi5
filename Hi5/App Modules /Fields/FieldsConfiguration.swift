//
//  FieldsConfiguration.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class FieldsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = FieldsViewController()
        let router = FieldsRouter(view: controller)
        let presenter = FieldsPresenter(view: controller)
        let manager = FieldsManager()
        let interactor = FieldsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}