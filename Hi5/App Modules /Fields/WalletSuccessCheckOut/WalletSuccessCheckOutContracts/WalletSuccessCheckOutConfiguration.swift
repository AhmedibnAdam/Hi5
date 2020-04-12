//
//  WalletSuccessCheckOutConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/9/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class WalletSuccessCheckOutConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = WalletSuccessCheckOutViewController()
        let router = WalletSuccessCheckOutRouter(view: controller)
        let presenter = WalletSuccessCheckOutPresenter(view: controller)
        let manager = WalletSuccessCheckOutManager()
        let interactor = WalletSuccessCheckOutInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}