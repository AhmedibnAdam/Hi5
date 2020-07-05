//
//  SuggestFieldDetailsConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class SuggestFieldDetailsConfiguration {
    static func setup(parameters: [String: Any] = [:] , latitude: Double , longitude: Double) -> UIViewController {
        let controller = SuggestFieldDetailsViewController()
        controller.lat = latitude
        controller.long = longitude
        let router = SuggestFieldDetailsRouter(view: controller)
        let presenter = SuggestFieldDetailsPresenter(view: controller)
        let manager = SuggestFieldDetailsManager()
        let interactor = SuggestFieldDetailsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
