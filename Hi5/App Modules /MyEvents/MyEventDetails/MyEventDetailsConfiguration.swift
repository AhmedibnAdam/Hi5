//
//  MyEventDetailsConfiguration.swift
//  Hi5
//
//  Created by Adam on 7/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation
import UIKit

class MyEventDetailsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = MyEventDetailsViewController()
        let router = MyEventDetailsRouter(view: controller)
        let presenter = MyEventDetailsPresenter(view: controller)
        let worker = MyEventDetailsWorker()
        let interactor = MyEventDetailsInteractor(presenter: presenter, worker: worker)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
