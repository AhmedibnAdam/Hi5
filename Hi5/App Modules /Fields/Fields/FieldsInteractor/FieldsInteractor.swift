//
//  FieldsInteractor.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFieldsInteractor: class {
	var parameters: [String: Any]? { get set }
    func nearBy(view : UIViewController , lon: Double , lat: Double)
    func favourite(view : UIViewController)
    func memberOf(view : UIViewController)
}

class FieldsInteractor: IFieldsInteractor {
    var presenter: IFieldsPresenter?
    var manager: IFieldsManager?
    var parameters: [String: Any]?

    init(presenter: IFieldsPresenter, manager: IFieldsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func nearBy(view: UIViewController, lon: Double, lat: Double) {
        manager?.nearByFromApi(lon: lon, lat: lat, complition: { (error, success, response) in
             if (success == true) {
                guard let response = response?.fields else {return}
                self.presenter?.showNearByResponse(response: response)
           } else {
               self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
           }
        })
    }
    func favourite(view: UIViewController) {
        manager?.favouriteFromApi(complition: { (error, success, response) in
             if (success == true) {
                  print("Favourite.....")
              } else {
                  self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
              }
        })
    }
    func memberOf(view: UIViewController) {
        manager?.memberOfFromApi(complition: { (error, success, response) in
             if (success == true) {
                 print("Member Of.....")
             } else {
                 self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
             }
        })
    }
}
