//
//  SessionDetailsRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/5/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISessionDetailsRouter: class {
    func navigateToCheckOutSessionDetails(session:  SessionDetailsModel.SessionDetailsResponse)
    func navigateToAllComments(id: Int)
}

class SessionDetailsRouter: ISessionDetailsRouter {

    
    weak var view: SessionDetailsViewController?
    
    init(view: SessionDetailsViewController?) {
        self.view = view
    }
    func navigateToCheckOutSessionDetails(session:  SessionDetailsModel.SessionDetailsResponse) {
        
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.checkOutSessionDetails(field: nil, session: session), completion: nil)
    }
       func navigateToAllComments(id: Int){
         view?.navigate(type: .modalWithNavigation, module: GeneralRoute.allComments(fieldId: id), completion: nil)
     }
} 
