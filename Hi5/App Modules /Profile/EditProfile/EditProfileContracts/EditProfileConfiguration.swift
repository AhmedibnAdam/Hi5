//
//  EditProfileConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/20/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class EditProfileConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = EditProfileViewController()
        let router = EditProfileRouter(view: controller)
        let presenter = EditProfilePresenter(view: controller)
        let manager = EditProfileManager()
        let interactor = EditProfileInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}