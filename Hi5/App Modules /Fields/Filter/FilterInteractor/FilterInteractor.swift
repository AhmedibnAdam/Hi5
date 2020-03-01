//
//  FilterInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFilterInteractor: class {
	var parameters: [String: Any]? { get set }
    func suggestionField(view : UIViewController)
}

class FilterInteractor: IFilterInteractor {
    var presenter: IFilterPresenter?
    var manager: IFilterManager?
    var parameters: [String: Any]?

    init(presenter: IFilterPresenter, manager: IFilterManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func suggestionField(view: UIViewController) {
        manager?.suggestionFieldFromApi(complition: { (error, success, response) in
            if (success == true) {
                if let resp = response {
                    self.presenter?.showResponse(response: resp)
                }
            } else {
                self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
            }
        })
    }
}
