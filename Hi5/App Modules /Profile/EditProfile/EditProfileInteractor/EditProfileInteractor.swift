//
//  EditProfileInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/20/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IEditProfileInteractor: class {
	var parameters: [String: Any]? { get set }
    func doEditProfile(view : UIViewController , editProfile: [String: Any]? , image: UIImage)
}

class EditProfileInteractor: IEditProfileInteractor {
    var presenter: IEditProfilePresenter?
    var manager: IEditProfileManager?
    var parameters: [String: Any]?

    init(presenter: IEditProfilePresenter, manager: IEditProfileManager) {
    	self.presenter = presenter
    	self.manager = manager
        
    }
    func doEditProfile(view: UIViewController, editProfile: [String : Any]? , image: UIImage) {
        manager?.editProfileFromApi(editProfile: editProfile ,image: image, complition: { (error, success) in
            if(success == true){
                self.presenter?.hideIndicator()
            }else{
                self.presenter?.hideIndicator()
                self.presenter?.showErrorAlert(title: "Alert", msg: "error profile information")
            }
        })
    }
}
