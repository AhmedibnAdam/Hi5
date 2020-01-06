//
//  CommentListsConfiguration.swift
//  Hi5
//
//  Created by Adam on 1/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class CommentListsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = CommentListsViewController()
        let router = CommentListsRouter(view: controller)
        let presenter = CommentListsPresenter(view: controller)
        let manager = CommentListsManager()
        let interactor = CommentListsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}