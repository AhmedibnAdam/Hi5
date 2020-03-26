//
//  ShowDetailsInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IShowDetailsInteractor: class {
	var parameters: [String: Any]? { get set }
    func showDetails(view: UIViewController , fieldId: String)
    func requestMemberShip(view: UIViewController , fieldId: Int)
    func cancelRequestMemberShip(view: UIViewController , fieldId: Int)
}

class ShowDetailsInteractor: IShowDetailsInteractor {
    var presenter: IShowDetailsPresenter?
    var manager: IShowDetailsManager?
    var parameters: [String: Any]?

    init(presenter: IShowDetailsPresenter, manager: IShowDetailsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func showDetails(view: UIViewController, fieldId: String) {
        manager?.showDetailsFromApi(id: fieldId, complition: { (error, success, response) in
            if (success == true){
                guard let response = response else {return}
                self.presenter?.showDetailsResponse(response: response)
            } else {
                self.presenter?.showErrorAlert(title: "Error", msg: "SomeThing Wrong")
            }
        })
    }
    func requestMemberShip(view: UIViewController, fieldId: Int) {
//        manager?.requestMemberShipFromApi(id: fieldId, complition: { (error, success, response) in
//            if (success == true){
//
//            } else {
//                self.presenter?.showErrorAlert(title: "Error", msg: "SomeThing Wrong")
//            }
//        })
    }
    func cancelRequestMemberShip(view: UIViewController, fieldId: Int) {
//        manager?.cancelRequestMemberShipFromApi(id: fieldId, complition: { (error, success, response) in
//            if(success == true){
//                
//            } else {
//                self.presenter?.showErrorAlert(title: "Error", msg: "SomeThing Wrong")
//            }
//        })
    }
}
