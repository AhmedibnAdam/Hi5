//
//  CommentPresenter.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICommentPresenter: class {
	 func showErrorAlert(title: String, msg: String)
    func showComment(response: CommentModel.LastComment)
}

class CommentPresenter: ICommentPresenter {	
	weak var view: ICommentViewController?
	
	init(view: ICommentViewController?) {
		self.view = view
	}
    func showErrorAlert(title: String, msg: String) {
           view?.showAlert(title: title, msg: msg)
     }
     func showComment(response: CommentModel.LastComment) {
              view?.showComment(response: response)
          }
}
