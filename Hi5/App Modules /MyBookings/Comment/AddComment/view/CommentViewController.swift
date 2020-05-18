//
//  CommentViewController.swift
//  Hi5
//
//  Created by Adam on 5/15/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICommentViewController: class {
	var router: ICommentRouter? { get set }
}

class CommentViewController: UIViewController {
	var interactor: ICommentInteractor?
	var router: ICommentRouter?
    lazy var backBtn: UIBarButtonItem = {
            return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtntapped))
        }()

	override func viewDidLoad() {
        super.viewDidLoad()
		setupNavigationBar()
    }
    
  
      
      @objc func backBtntapped() {
        self.dismiss()
      }
}

extension CommentViewController: ICommentViewController {
	// do someting...
}

extension CommentViewController {
	
    func setupNavigationBar() {
        navigationItem.title = "Comment"
        let button = UIButton(type: .system)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
        button.sizeToFit()
        button.tintColor = .black
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}

extension CommentViewController {
	// do someting...
}
