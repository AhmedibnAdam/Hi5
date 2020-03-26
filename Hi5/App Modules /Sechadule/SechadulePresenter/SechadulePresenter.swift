//
//  SechadulePresenter.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/14/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISechadulePresenter: class {
       func showAlert(title: String, msg: String)
    func showUpCommingSechadule(response: SechaduleModel.SechaduleSessions)
    func showPastSechadule(response: SechaduleModel.PastSechaduleResponse)
    func showCancledSechadule(response: SechaduleModel.CanceledSechaduleResponse)

}

class SechadulePresenter: ISechadulePresenter {

  
	weak var view: ISechaduleViewController?
	
	init(view: ISechaduleViewController?) {
		self.view = view
	}
    
    func showAlert(title: String, msg: String) {
           view?.showAlert(title: title, msg: msg)
    }
    
    func showUpCommingSechadule(response: SechaduleModel.SechaduleSessions) {
           view?.showUpCommingSechadule(response: response)
    }
    
    func showPastSechadule(response: SechaduleModel.PastSechaduleResponse) {
        view?.showPastSechadule(response: response)
    }
    
    func showCancledSechadule(response: SechaduleModel.CanceledSechaduleResponse) {
         view?.showCancledSechadule(response: response)
    }
    
}
