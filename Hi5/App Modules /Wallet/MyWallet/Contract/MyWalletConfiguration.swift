//
//  MyWalletConfiguration.swift
//  Hi5
//
//  Created by Adam on 4/17/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class MyWalletConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = MyWalletViewController()
        let router = MyWalletRouter(view: controller)
        let presenter = MyWalletPresenter(view: controller)
        let manager = MyWalletManager()
        let interactor = MyWalletInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}