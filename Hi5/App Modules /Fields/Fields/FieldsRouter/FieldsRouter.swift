//
//  FieldsRouter.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFieldsRouter: class {
    func navigateToTabBar()
    func navigateToShowdetails(param: [String : Any], field_id: String)
    func navigateToFilter(param: [String : Any])
    func navigateToAllComments(field_id: Int)
    func navigateToProfile(param: [String: Any], partner_id: Int)
}

class FieldsRouter: IFieldsRouter {
  
    
    weak var view: FieldsViewController?
    
    init(view: FieldsViewController?) {
        self.view = view
    }
    func navigateToTabBar() {
        view?.navigate(type: .modal, module: GeneralRoute.tabBar, completion: nil)
    }
 
    func navigateToFilter(param: [String : Any]) {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.filter(param: param), completion: nil)
    }
    func navigateToShowdetails(param:  [String : Any] , field_id: String) {
           view?.navigate(type: .modal, module: GeneralRoute.showDetailsFields(param: param, field_id: field_id))
       }
  
    func navigateToAllComments(field_id: Int){
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.allComments(fieldId: field_id), completion: nil)
    }
    func navigateToProfile(param: [String: Any], partner_id: Int){
        view?.navigate(type: .modal, module: GeneralRoute.profile(param: param, id: partner_id), completion: nil)
    }
}

