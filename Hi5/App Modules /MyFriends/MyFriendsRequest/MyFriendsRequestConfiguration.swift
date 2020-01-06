//
//  MyFriendsRequestConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class MyFriendsRequestConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = MyFriendsRequestViewController()
        let router = MyFriendsRequestRouter(view: controller)
        let presenter = MyFriendsRequestPresenter(view: controller)
        let manager = MyFriendsRequestManager()
        let interactor = MyFriendsRequestInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}