//
//  SuggestFieldConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/24/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class SuggestFieldConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = SuggestFieldViewController()
        let router = SuggestFieldRouter(view: controller)
        let presenter = SuggestFieldPresenter(view: controller)
        let manager = SuggestFieldManager()
        let interactor = SuggestFieldInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}