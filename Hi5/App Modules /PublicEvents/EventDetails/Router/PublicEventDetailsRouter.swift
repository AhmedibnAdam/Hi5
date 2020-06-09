//
//  PublicEventDetailsRouter.swift
//  Hi5
//
//  Created by Adam on 4/6/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPublicEventDetailsRouter: class {
    func navigateToCheckOutSessionDetails(field: PublicEventDetailsModel.PublicEventDetails)
    func navigateToUserProfile(params: [String: Any] , id: Int)
}

class PublicEventDetailsRouter: IPublicEventDetailsRouter {
    weak var view: PublicEventDetailsViewController?
    
    init(view: PublicEventDetailsViewController?) {
        self.view = view
    }
    func navigateToCheckOutSessionDetails(field: PublicEventDetailsModel.PublicEventDetails) {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.checkOutSessionDetails(field: field ,session: nil), completion: nil)
    }
    func navigateToUserProfile(params: [String: Any] , id: Int) {
           view?.navigate(type: .modal, module: GeneralRoute.profile(param: params, id: id), completion: nil)
       }
    
}
