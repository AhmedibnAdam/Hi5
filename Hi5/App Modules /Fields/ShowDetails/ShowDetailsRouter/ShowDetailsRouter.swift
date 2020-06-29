//
//  ShowDetailsRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IShowDetailsRouter: class {
    func navigateToFields()
    func navigateToSessionResult(param: [String: Any] ,fieldId: Int , fieldName: String)
    func navigateToAllComments(id: Int)
    func navigateToProfile(param: [String: Any], partner_id: Int)
}

class ShowDetailsRouter: IShowDetailsRouter {
    weak var view: ShowDetailsViewController?
    
    init(view: ShowDetailsViewController?) {
        self.view = view
    }
    func navigateToFields() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.fields, completion: nil)
    }
    func navigateToSessionResult(param: [String: Any] , fieldId: Int , fieldName: String) {
        var paramerters: [String: Any]?
        paramerters = param
        paramerters?["field_id"] = "\(fieldId)"
        paramerters?["name"] = fieldName
        view?.navigate(type: .modal, module: GeneralRoute.filterResult(param: paramerters! , type: "checkAvalable"), completion: nil)
    }
    func navigateToAllComments(id: Int){
         view?.navigate(type: .modalWithNavigation, module: GeneralRoute.allComments(fieldId: id), completion: nil)
     }
    
    func navigateToProfile(param: [String: Any], partner_id: Int){
          view?.navigate(type: .modal, module: GeneralRoute.profile(param: param, id: partner_id), completion: nil)
      }
}
