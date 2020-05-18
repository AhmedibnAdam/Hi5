//
//  AllCommentsConfiguration.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class AllCommentsConfiguration {
    static func setup(parameters: [String: Any] = [:],fieldId: Int) -> UIViewController {
        let controller = AllCommentsViewController()
        controller.fieldID = fieldId
        let router = AllCommentsRouter(view: controller)
        let presenter = AllCommentsPresenter(view: controller)
        let manager = AllCommentsManager()
        let interactor = AllCommentsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
