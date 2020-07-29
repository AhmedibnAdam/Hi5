//
//  ReceiptConfiguration.swift
//  Hi5
//
//  Created by Adam on 7/29/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation
import UIKit

class ReceiptConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = ReceiptViewController()
        let router = ReceiptRouter(view: controller)
        let presenter = ReceiptPresenter(view: controller)
        let worker = ReceiptWorker()
        let interactor = ReceiptInteractor(presenter: presenter, worker: worker)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
