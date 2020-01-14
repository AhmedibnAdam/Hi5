//
//  CreatePasswordInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICreatePasswordInteractor: class {
	var parameters: [String: Any]? { get set }
    func doCreatePassword(view : UIViewController , password: String , confirmPassword: String)
}

class CreatePasswordInteractor: ICreatePasswordInteractor {

    var presenter: ICreatePasswordPresenter?
    var manager: ICreatePasswordManager?
    var parameters: [String: Any]?

    init(presenter: ICreatePasswordPresenter, manager: ICreatePasswordManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func doCreatePassword(view: UIViewController, password: String, confirmPassword: String) {
        manager?.createPasswordFromApi(password: password , confirmPassword: confirmPassword, complition: { (error , success) in
            if (success == true) {
               print("Done.........")
            } else {
                self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
            }
            
        })
        
    }
}
