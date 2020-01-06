//
//  TransactionsConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class TransactionsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = TransactionsViewController()
        let router = TransactionsRouter(view: controller)
        let presenter = TransactionsPresenter(view: controller)
        let manager = TransactionsManager()
        let interactor = TransactionsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}