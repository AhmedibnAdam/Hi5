//
//  BookingDetailsConfiguration.swift
//  Hi5
//
//  Created by Adam on 5/11/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class BookingDetailsConfiguration {
    static func setup(parameters: [String: Any] = [:] , id: Int, type: Int) -> UIViewController {
        let controller = BookingDetailsViewController()
        controller.id = id
        controller.type = type
        let router = BookingDetailsRouter(view: controller)
        let presenter = BookingDetailsPresenter(view: controller)
        let manager = BookingDetailsManager()
        let interactor = BookingDetailsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
