//
//  AddFundConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class AddFundConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = AddFundViewController()
        let router = AddFundRouter(view: controller)
        let presenter = AddFundPresenter(view: controller)
        let manager = AddFundManager()
        let interactor = AddFundInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}