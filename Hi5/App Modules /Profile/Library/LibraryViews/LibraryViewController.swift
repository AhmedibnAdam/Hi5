//
//  LibraryViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILibraryViewController: class {
	var router: ILibraryRouter? { get set }
    func showAlert(title: String, msg: String)
}

class LibraryViewController: UIViewController {
	var interactor: ILibraryInteractor?
	var router: ILibraryRouter?
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(dismissView))
    }()
    
    lazy var checkMarkBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "checkMark"), style: .done, target: self, action: #selector(checkMarkBtnTapped))
    }()
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func checkMarkBtnTapped() {
        
    }
    //MARK:- View Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        initView()
        configure()
    }
}

//MARK:- Extensions
extension LibraryViewController: ILibraryViewController {
     func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
}

extension LibraryViewController {
    func setupNavigationBar() {
        navigationItem.title = "Library"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.setRightBarButton(checkMarkBtn, animated: true)
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.isEnabled = false
        navigationItem.rightBarButtonItem?.tintColor = UIColor.clear
    }
    func initView() {
        
    }
    func configure() {
        router = LibraryRouter(view: self)
    }
}

extension LibraryViewController {
}
