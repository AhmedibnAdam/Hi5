//
//  GalleryConfiguration.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

class GalleryConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = GalleryViewController()
        let router = GalleryRouter(view: controller)
        let presenter = GalleryPresenter(view: controller)
        let manager = GalleryManager()
        let interactor = GalleryInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}