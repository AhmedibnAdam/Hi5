//
//  MyFavoriteFriendsConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class MyFavoriteFriendsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = MyFavoriteFriendsViewController()
        let router = MyFavoriteFriendsRouter(view: controller)
        let presenter = MyFavoriteFriendsPresenter(view: controller)
        let manager = MyFavoriteFriendsManager()
        let interactor = MyFavoriteFriendsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}