//
//  FieldOwnerDetailsConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class FieldOwnerDetailsConfiguration {
    static func setup(parameters: [String: Any] = [:] , param: [String: Any] , images: [UIImage]) -> UIViewController {
        let controller = FieldOwnerDetailsViewController()
        controller.param = param
        controller.images = images
        let router = FieldOwnerDetailsRouter(view: controller)
        let presenter = FieldOwnerDetailsPresenter(view: controller)
        let manager = FieldOwnerDetailsManager()
        let interactor = FieldOwnerDetailsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
