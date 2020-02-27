//
//  LocationConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/26/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class LocationConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = LocationViewController()
        let router = LocationRouter(view: controller)
        let presenter = LocationPresenter(view: controller)
        let manager = LocationManager()
        let interactor = LocationInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}