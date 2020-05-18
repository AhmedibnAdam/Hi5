//
//  FilterResultRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/26/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFilterResultRouter: class {
  func navigateToFilter(params: [String: Any])
    func navigateTosessionDetails(param: [String: Any] ,id: Int, payment: String, sessionId: Int)
}

class FilterResultRouter: IFilterResultRouter {
 
    
    weak var view: FilterResultViewController?
    
    init(view: FilterResultViewController?) {
        self.view = view
    }
    func navigateToFilter(params: [String: Any]) {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.filter(param: params), completion: nil)
    }
      func navigateTosessionDetails(param: [String: Any] , id: Int, payment: String, sessionId: Int) {
        view?.navigate(type: .modal, module: GeneralRoute.sessionDetails(param: param ,id: id, payment: payment, sessionId: sessionId), completion: nil)
       }
       
    
}
