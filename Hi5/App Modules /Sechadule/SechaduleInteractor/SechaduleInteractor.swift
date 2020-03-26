//
//  SechaduleInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/14/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISechaduleInteractor: class {
	var parameters: [String: Any]? { get set }
    func getPastSechadule(view: UIViewController)
       func getUpCommingSechadule(view: UIViewController)
       func getCancelSechadule(view: UIViewController)
}

class SechaduleInteractor: ISechaduleInteractor {

    var presenter: ISechadulePresenter?
    var manager: ISechaduleManager?
    var parameters: [String: Any]?

    init(presenter: ISechadulePresenter, manager: ISechaduleManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func getPastSechadule(view: UIViewController) {
        manager?.getUpCommingSechaduleFromApi(complition: { (error, success, response) in
            if (success == true) {
                
                guard let response = response else {return}
                self.presenter?.showUpCommingSechadule(response: response)
                if (response.fields?.count == 0){
                   
                }
            } else {
                self.presenter?.showAlert(title: "Error", msg: "SomeThing Wrong")
            }
        })
    }
    
    func getUpCommingSechadule(view: UIViewController) {
        manager?.getPastSechaduleFromApi(complition: { (error, success, response) in
            if (success == true) {
                
                guard let response = response else {return}
                if (response.fields?.count != 0){
                    self.presenter?.showPastSechadule(response: response)
                }
            } else {
                
                self.presenter?.showAlert(title: "Error", msg: "SomeThing Wrong")
            }
        })
    }
    
    func getCancelSechadule(view: UIViewController) {
        manager?.getCancelSechaduleFromApi(complition: { (error, success, response) in
            if (success == true) {
                
                guard let response = response else {return}
                if (response.fields?.count != 0){
                    self.presenter?.showCancledSechadule(response: response)
                    
                }
            } else {
                
                self.presenter?.showAlert(title: "Error", msg: "SomeThing Wrong")
            }
        })
    }
    
}
