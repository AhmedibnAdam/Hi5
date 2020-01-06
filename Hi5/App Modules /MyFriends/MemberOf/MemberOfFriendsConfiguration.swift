//
//  MemberOfFriendsConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class MemberOfFriendsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = MemberOfFriendsViewController()
        let router = MemberOfFriendsRouter(view: controller)
        let presenter = MemberOfFriendsPresenter(view: controller)
        let manager = MemberOfFriendsManager()
        let interactor = MemberOfFriendsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}