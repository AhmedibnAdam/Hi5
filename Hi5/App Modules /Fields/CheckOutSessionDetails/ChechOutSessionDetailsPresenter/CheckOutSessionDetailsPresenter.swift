//
//  CheckOutSessionDetailsPresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICheckOutSessionDetailsPresenter: class {
    func showErrorAlert(title: String, msg: String)

        func showDetailsResponse(response: CheckOutSessionDetailsModel.PublicEventDetailsJoin?)

}

class CheckOutSessionDetailsPresenter: ICheckOutSessionDetailsPresenter {
    weak var view: ICheckOutSessionDetailsViewController?
    
    init(view: ICheckOutSessionDetailsViewController?) {
        self.view = view
    }
    func showDetailsResponse(response: CheckOutSessionDetailsModel.PublicEventDetailsJoin?){
        view?.showDetailsResponse(response: response)
        
    }
    func showErrorAlert(title: String, msg: String){
        view?.showAlert(title: title, msg: msg)
    }

}
