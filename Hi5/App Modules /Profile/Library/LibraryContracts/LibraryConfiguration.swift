//
//  LibraryConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class LibraryConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = LibraryViewController()
        let router = LibraryRouter(view: controller)
        let presenter = LibraryPresenter(view: controller)
        let manager = LibraryManager()
        let interactor = LibraryInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}