//
//  MyBookingsConfiguration.swift
//  Hi5
//
//  Created by Adam on 3/18/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class MyBookingsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = MyBookingsViewController()
        let router = MyBookingsRouter(view: controller)
        let presenter = MyBookingsPresenter(view: controller)
        let manager = MyBookingsManager()
        let interactor = MyBookingsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}