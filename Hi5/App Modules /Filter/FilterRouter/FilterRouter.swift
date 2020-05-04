//
//  FilterRouter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFilterRouter: class {
    func navigateToFields()
    func navigateToFilterResult(parameter: [String: Any])
}

class FilterRouter: IFilterRouter {
    weak var view: FilterViewController?
    
    init(view: FilterViewController?) {
        self.view = view
    }
    func navigateToFields() {
        view?.navigate(type: .modalWithNavigation, module: GeneralRoute.fields, completion: nil)
    }
    func navigateToFilterResult(parameter: [String : Any]) {
        view?.navigate(type: .modal, module: GeneralRoute.filterResult(param: parameter, type: "filter"), completion: nil)
    }
}
