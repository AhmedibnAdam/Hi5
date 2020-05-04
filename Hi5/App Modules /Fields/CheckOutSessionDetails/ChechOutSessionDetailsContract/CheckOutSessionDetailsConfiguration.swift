//
//  CheckOutSessionDetailsConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class CheckOutSessionDetailsConfiguration {
    static func setup(parameters: [String: Any] = [:] , field: PublicEventDetailsModel.PublicEventDetails? , session: SessionDetailsModel.SessionDetailsResponse?) -> UIViewController {
        let controller = CheckOutSessionDetailsViewController()
        controller.fieldData = field
        controller.sessionData = session
        let router = CheckOutSessionDetailsRouter(view: controller)
        let presenter = CheckOutSessionDetailsPresenter(view: controller)
        let manager = CheckOutSessionDetailsManager()
        let interactor = CheckOutSessionDetailsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
