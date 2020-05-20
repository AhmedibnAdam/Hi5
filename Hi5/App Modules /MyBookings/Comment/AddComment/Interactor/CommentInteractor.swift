//
//  CommentInteractor.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICommentInteractor: class {
	var parameters: [String: Any]? { get set }
     func addComment()
}

class CommentInteractor: ICommentInteractor {
    var presenter: ICommentPresenter?
    var manager: ICommentManager?
    var parameters: [String: Any]?

    init(presenter: ICommentPresenter, manager: ICommentManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func addComment() {
        manager?.addComment(parameters: parameters!, complition: { (error, success, response) in
             if (success == true) {
                guard let response = response else {return}
                self.presenter?.showErrorAlert(title: "Alert", msg: (response.msg ?? "" ))
             
              } else {
                self.presenter?.showErrorAlert(title: "Sorry!", msg: (error?.message ?? "comment can not add"))
              }
        })
    }
}
