//
//  EditProfileViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/20/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IEditProfileViewController: class {
	var router: IEditProfileRouter? { get set }
    func showAlert(title: String, msg: String)
}

class EditProfileViewController: UIViewController {
	var interactor: IEditProfileInteractor?
	var router: IEditProfileRouter?
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(dismissView))
    }()
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
//MARK:- Outlets
    
    

//MARK:- View Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
//MARK:- Actions
    
    
}
//MARK:- Extensions
extension EditProfileViewController: IEditProfileViewController {
    func showAlert(title: String, msg: String) {
     ShowAlertView.showAlert(title: title, msg: msg, sender: self)
   }
}

extension EditProfileViewController {
    func setupNavigationBar() {
        navigationItem.title = "Edit Profile"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}

extension EditProfileViewController {
	// do someting...
}
