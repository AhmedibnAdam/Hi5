//
//  ProfileInteractor.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IProfileInteractor: class {
	var parameters: [String: Any]? { get set }
    func doShowProfile(view : UIViewController)
}

class ProfileInteractor: IProfileInteractor {
    var presenter: IProfilePresenter?
    var manager: IProfileManager?
    var parameters: [String: Any]?

    init(presenter: IProfilePresenter, manager: IProfileManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func doShowProfile(view : UIViewController){
        manager?.showProfileFromApi(complition: { (error, success) in
            if (success == true) {
                self.presenter?.hideIndecator()
            } else {
                self.presenter?.hideIndecator()
                self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
            }
        })
    }
}
