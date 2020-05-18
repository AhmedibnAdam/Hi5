//
//  AllCommentsPresenter.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAllCommentsPresenter: class {
	func showWalletResponse(response: AllCommentsModel.Comments)
    func showErrorAlert(title: String, msg: String)
}

class AllCommentsPresenter: IAllCommentsPresenter {	
	weak var view: IAllCommentsViewController?
	
	init(view: IAllCommentsViewController?) {
		self.view = view
	}
    func showWalletResponse(response: AllCommentsModel.Comments) {
           view?.showWalletResponse(response: response)
       }
       
       func showErrorAlert(title: String, msg: String) {
           view?.showErrorAlert(title: title, msg: msg)
       }
}
