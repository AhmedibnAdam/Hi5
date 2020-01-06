//
//  MyFriendsConfiguration.swift
//  Hi5
//
//  Created by Adam on 12/31/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class MyFriendsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = MyFriendsViewController()
        let router = MyFriendsRouter(view: controller)
        let presenter = MyFriendsPresenter(view: controller)
        let manager = MyFriendsManager()
        let interactor = MyFriendsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}