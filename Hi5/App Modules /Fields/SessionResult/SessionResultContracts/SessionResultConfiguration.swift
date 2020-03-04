//
//  SessionResultConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/4/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class SessionResultConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = SessionResultViewController()
        let router = SessionResultRouter(view: controller)
        let presenter = SessionResultPresenter(view: controller)
        let manager = SessionResultManager()
        let interactor = SessionResultInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}