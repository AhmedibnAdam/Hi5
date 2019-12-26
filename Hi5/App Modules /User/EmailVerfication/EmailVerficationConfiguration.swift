//
//  EmailVerficationConfiguration.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class EmailVerficationConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = EmailVerficationViewController()
        let router = EmailVerficationRouter(view: controller)
        let presenter = EmailVerficationPresenter(view: controller)
        let manager = EmailVerficationManager()
        let interactor = EmailVerficationInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}