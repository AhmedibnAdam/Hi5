//
//  TermsConfiguration.swift
//  Hi5
//
//  Created by Adam on 7/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ahmed Adam
//              * ibn.abuadam@gmail.com
//              * https://github.com/AhmedibnAdam

import Foundation
import UIKit

class TermsConfiguration {
    static func setup(parameters: [String: Any] = [:], url: String) -> UIViewController {
        let controller = TermsViewController()
        controller.url = url
        let router = TermsRouter(view: controller)
        let presenter = TermsPresenter(view: controller)
        let worker = TermsWorker()
        let interactor = TermsInteractor(presenter: presenter, worker: worker)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
