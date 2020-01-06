//
//  AddFriendRequestConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class AddFriendRequestConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = AddFriendRequestViewController()
        let router = AddFriendRequestRouter(view: controller)
        let presenter = AddFriendRequestPresenter(view: controller)
        let manager = AddFriendRequestManager()
        let interactor = AddFriendRequestInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}