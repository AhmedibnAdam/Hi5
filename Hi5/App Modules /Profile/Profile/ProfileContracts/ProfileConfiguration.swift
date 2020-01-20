//
//  ProfileConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class ProfileConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = ProfileViewController()
        let router = ProfileRouter(view: controller)
        let presenter = ProfilePresenter(view: controller)
        let manager = ProfileManager()
        let interactor = ProfileInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}