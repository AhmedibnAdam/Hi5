//
//  ChangeUsernameInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IChangeUsernameInteractor: class {
	var parameters: [String: Any]? { get set }
    func doChangeUserName(view : UIViewController , username: String)
}

class ChangeUsernameInteractor: IChangeUsernameInteractor {
    var presenter: IChangeUsernamePresenter?
    var manager: IChangeUsernameManager?
    var parameters: [String: Any]?

    init(presenter: IChangeUsernamePresenter, manager: IChangeUsernameManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func doChangeUserName(view: UIViewController, username: String) {
        manager?.changeUsernameFromApi(username: username, complition: { (error, succes) in
            if(succes == true){
                print("navigate to home.......")
            } else {
                 self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
            }
        })
    }
}
