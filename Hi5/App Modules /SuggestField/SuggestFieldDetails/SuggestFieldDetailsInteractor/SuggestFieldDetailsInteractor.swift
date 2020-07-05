//
//  SuggestFieldDetailsInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISuggestFieldDetailsInteractor: class {
	var parameters: [String: Any]? { get set }
    func suggestFieldData(view : UIViewController)
}

class SuggestFieldDetailsInteractor: ISuggestFieldDetailsInteractor {

    var presenter: ISuggestFieldDetailsPresenter?
    var manager: ISuggestFieldDetailsManager?
    var parameters: [String: Any]?

    init(presenter: ISuggestFieldDetailsPresenter, manager: ISuggestFieldDetailsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func suggestFieldData(view: UIViewController) {
        manager?.suggestFieldFromApi(complition: { (error, success, response) in
            if (success == true) {
                self.presenter?.removeLoadingIndicator()
                if (response?.status == true){
                    guard let response = response else {return}
                    self.presenter?.showResponse(response: response)
                } else {
                    self.presenter?.showErrorAlert(title: "OOps", msg: "Something wont wrong")
                }
            } else {
                self.presenter?.removeLoadingIndicator()
                self.presenter?.showErrorAlert(title: "OOps", msg: "Something wont wrong")
            }
        })
    }
}
