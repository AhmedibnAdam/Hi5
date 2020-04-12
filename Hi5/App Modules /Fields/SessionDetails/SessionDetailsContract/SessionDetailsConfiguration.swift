//
//  SessionDetailsConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/5/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class SessionDetailsConfiguration {
    static func setup(parameters: [String: Any] = [:] , id: Int , payment: String , sessionId: Int) -> UIViewController {
        let controller = SessionDetailsViewController()
        controller.id = id
        controller.payment = payment
        controller.sessionId = sessionId
        let router = SessionDetailsRouter(view: controller)
        let presenter = SessionDetailsPresenter(view: controller)
        let manager = SessionDetailsManager()
        let interactor = SessionDetailsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
