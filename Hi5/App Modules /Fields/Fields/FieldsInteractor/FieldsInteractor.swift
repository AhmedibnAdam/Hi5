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
    func addFavourite(view: UIViewController , fieldId: Int)
    func removeFavourite(view: UIViewController , fieldId: Int)
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
                self.presenter?.removeNoFavouriteFields()
                self.presenter?.removeNoMemberFields()
                guard let response = response else {return}
                self.presenter?.showResponse(response: response)
           } else {
                self.presenter?.removeNoFavouriteFields()
                self.presenter?.removeNoMemberFields()
               self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
           }
        })
    }
    func addFavourite(view: UIViewController, fieldId: Int) {
        manager?.addFavouriteFromApi(fieldId: fieldId, complition: { (error, success, response) in
            if (success == true){
                print("Added Favourite Done......")
            } else {
                self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
            }
        })
    }
    func removeFavourite(view: UIViewController, fieldId: Int) {
        manager?.removeFavouriteFromApi(fieldId: fieldId, complition: { (error, success, response) in
            if(success == true){
                print("Removed Favourite Done.....")
            } else {
                self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
            }
        })
    }
    func favourite(view: UIViewController) {
        manager?.favouriteFromApi(complition: { (error, success, response) in
             if (success == true) {
                self.presenter?.removeNoFavouriteFields()
                self.presenter?.removeNoMemberFields()
                guard let response = response else {return}
                 self.presenter?.showFavorites(response: response)
                if (response.fields?.count == 0){
                    self.presenter?.showNoFavouriteFields()
                }
              } else {
                self.presenter?.removeNoFavouriteFields()
                self.presenter?.removeNoMemberFields()
                  self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
              }
        })
    }
    func memberOf(view: UIViewController) {
        manager?.memberOfFromApi(complition: { (error, success, response) in
             if (success == true) {
                self.presenter?.removeNoFavouriteFields()
                self.presenter?.removeNoMemberFields()
                 guard let response = response else {return}
                 self.presenter?.showMemberFields(response: response)
                if (response.fields?.count == 0) {
                    self.presenter?.showNoMemberOfFields()
                }
             } else {
                self.presenter?.removeNoFavouriteFields()
                self.presenter?.removeNoMemberFields()
                 self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
             }
        })
    }
}
