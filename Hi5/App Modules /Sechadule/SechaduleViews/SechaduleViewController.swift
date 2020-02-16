//
//  SechaduleViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/14/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISechaduleViewController: class {
	var router: ISechaduleRouter? { get set }
}

class SechaduleViewController: UIViewController {
	var interactor: ISechaduleInteractor?
	var router: ISechaduleRouter?

    //MARK: - Properties
    lazy var buttonSlideBar: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "menu"), style: .done, target: self, action: #selector(sideMenu))
    }()
    
    @objc func sideMenu() {
        print("b555555........")
    }
    //MARK: - ViewLifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
		setupNavigationBar()
    }
}

//MARK: - Extensions
extension SechaduleViewController: ISechaduleViewController {
	// do someting...
}

extension SechaduleViewController {
	// do someting...
}

extension SechaduleViewController {
    func setupNavigationBar() {
        navigationItem.title = "Sechadule"
        navigationItem.setLeftBarButton(buttonSlideBar, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}
