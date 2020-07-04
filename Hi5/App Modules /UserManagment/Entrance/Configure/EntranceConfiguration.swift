//
//  EntranceConfiguration.swift
//  Hi5
//
//  Created by Adam on 7/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation
import UIKit

class EntranceConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = EntranceViewController()
        let router = EntranceRouter(view: controller)
        let presenter = EntrancePresenter(view: controller)
        let worker = EntranceWorker()
        let interactor = EntranceInteractor(presenter: presenter, worker: worker)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
