//
//  MakeWalletPasswordConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class MakeWalletPasswordConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = MakeWalletPasswordViewController()
        let router = MakeWalletPasswordRouter(view: controller)
        let presenter = MakeWalletPasswordPresenter(view: controller)
        let manager = MakeWalletPasswordManager()
        let interactor = MakeWalletPasswordInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}