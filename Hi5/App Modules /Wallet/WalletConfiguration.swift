//
//  WalletConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class WalletConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = WalletViewController()
        let router = WalletRouter(view: controller)
        let presenter = WalletPresenter(view: controller)
        let manager = WalletManager()
        let interactor = WalletInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}