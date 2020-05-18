//
//  AllCommentsInteractor.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IAllCommentsInteractor: class {
	var parameters: [String: Any]? { get set }
    func showComment(id: Int)
}

class AllCommentsInteractor: IAllCommentsInteractor {
    var presenter: IAllCommentsPresenter?
    var manager: IAllCommentsManager?
    var parameters: [String: Any]?

    init(presenter: IAllCommentsPresenter, manager: IAllCommentsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func showComment(id: Int){
        manager?.getComments(id: id ,complition: { (error, success, response) in
            if (success == true){
                guard let response = response else {return}
                self.presenter?.showWalletResponse(response: response)
            } else {
                self.presenter?.showErrorAlert(title: "Error", msg: "Something Wrong")
            }
        })
    }
}
