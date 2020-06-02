//
//  CommentConfiguration.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class CommentConfiguration {
    static func setup(parameters: [String: Any] = [:] ) -> UIViewController {
        let controller = CommentViewController()
        controller.fieldId = parameters["field_id"] as? Int
        controller.sessionId = parameters["session_id"] as? Int
        controller.date = parameters["date"] as? String
        let router = CommentRouter(view: controller)
        let presenter = CommentPresenter(view: controller)
        let manager = CommentManager()
        let interactor = CommentInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
