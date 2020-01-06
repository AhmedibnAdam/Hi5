//
//  MyFriendsDetailsConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class MyFriendsDetailsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = MyFriendsDetailsViewController()
        let router = MyFriendsDetailsRouter(view: controller)
        let presenter = MyFriendsDetailsPresenter(view: controller)
        let manager = MyFriendsDetailsManager()
        let interactor = MyFriendsDetailsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}