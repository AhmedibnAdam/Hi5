//
//  FieldOwnerDetailsInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 3/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IFieldOwnerDetailsInteractor: class {
	var parameters: [String: Any]? { get set }
    func addSuggestFieldData(parameter: [String: Any] , images: [UIImage] , view: UIViewController)
}

class FieldOwnerDetailsInteractor: IFieldOwnerDetailsInteractor {
    var presenter: IFieldOwnerDetailsPresenter?
    var manager: IFieldOwnerDetailsManager?
    var parameters: [String: Any]?

    init(presenter: IFieldOwnerDetailsPresenter, manager: IFieldOwnerDetailsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func addSuggestFieldData(parameter: [String : Any] , images: [UIImage] , view: UIViewController) {
        manager?.addSuggestFieldFromApi(parameter: parameter, images: images, complition: { (error, success, response) in
            if (success == true){
                if(response?.status == true){
                    print("Done....")
                    self.presenter?.showAlert(title: "Alert", msg: "Suggested field addes successfully !")
                } else {
                    self.presenter?.showAlert(title: "ERROR", msg: "bad Request")
                }
            } else {
                self.presenter?.showAlert(title: "OOps", msg: "Somthing wont wrong")
            }
        })
    }
}
