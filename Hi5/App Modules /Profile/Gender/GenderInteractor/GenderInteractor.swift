//
//  GenderInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/21/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IGenderInteractor: class {
	var parameters: [String: Any]? { get set }
    func doGenderEditProfile(view : UIViewController , gender: String)
}

class GenderInteractor: IGenderInteractor {    
    var presenter: IGenderPresenter?
    var manager: IGenderManager?
    var parameters: [String: Any]?

    init(presenter: IGenderPresenter, manager: IGenderManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func doGenderEditProfile(view: UIViewController, gender: String) {
        manager?.genderEditProfileFromApi(gender: gender, complition: { (error, success) in
            if (success == true) {
                self.presenter?.hideIndicator()
                self.presenter?.navigateToEditProfile()
            } else {
                self.presenter?.hideIndicator()
                self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
            }
        })
    }
}
