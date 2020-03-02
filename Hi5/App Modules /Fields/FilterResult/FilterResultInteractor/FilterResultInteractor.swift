//
//  FilterResultInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/26/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFilterResultInteractor: class {
	var parameters: [String: Any]? { get set }
    func filterSession(view : UIViewController , parameter: [String: Any])
}

class FilterResultInteractor: IFilterResultInteractor {
    var presenter: IFilterResultPresenter?
    var manager: IFilterResultManager?
    var parameters: [String: Any]?

    init(presenter: IFilterResultPresenter, manager: IFilterResultManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func filterSession(view: UIViewController, parameter: [String : Any]) {
        manager?.filterSessionFromApi(parameter: parameter, complition: { (error, success, response) in
            if (success == true) {
                guard let response = response else {return}
                
            } else {
                
            }
        })
    }
}
