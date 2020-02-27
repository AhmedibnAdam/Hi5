//
//  DateOfBirthConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/21/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class DateOfBirthConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = DateOfBirthViewController()
        let router = DateOfBirthRouter(view: controller)
        let presenter = DateOfBirthPresenter(view: controller)
        let manager = DateOfBirthManager()
        let interactor = DateOfBirthInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}