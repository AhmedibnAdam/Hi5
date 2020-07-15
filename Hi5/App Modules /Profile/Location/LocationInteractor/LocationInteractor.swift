//
//  LocationInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/26/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILocationInteractor: class {
	var parameters: [String: Any]? { get set }
    func doLocationEditProfile(view : UIViewController , country: String , countryFlag: String , city: String , cityFlag: String , state: String , stateFlag: String)
}

class LocationInteractor: ILocationInteractor {
    var presenter: ILocationPresenter?
    var manager: ILocationManager?
    var parameters: [String: Any]?

    init(presenter: ILocationPresenter, manager: ILocationManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func doLocationEditProfile(view: UIViewController, country: String, countryFlag: String, city: String, cityFlag: String, state: String, stateFlag: String) {
        manager?.locationEditProfileFromApi(country: country, countryFlag: countryFlag, city: city, cityFlag: cityFlag, state: state, stateFlag: stateFlag, complition: { (error, success , response) in
            if(success == true){
                if (response?.status != nil){
                    self.presenter?.hideIndicator()
                    self.presenter?.navigateToEditProfile()
                } else {
                    self.presenter?.hideIndicator()
                    self.presenter?.showErrorAlert(title: "Error", msg: "please enter your country, city and state")
                }
                
            } else {
                self.presenter?.hideIndicator()
                self.presenter?.showErrorAlert(title: "Alert", msg: "please enter your country, city and state")
            }
        })
    }
}
