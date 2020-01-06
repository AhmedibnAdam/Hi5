//
//  AddFriendsConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class AddFriendsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = AddFriendsViewController()
        let router = AddFriendsRouter(view: controller)
        let presenter = AddFriendsPresenter(view: controller)
        let manager = AddFriendsManager()
        let interactor = AddFriendsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}