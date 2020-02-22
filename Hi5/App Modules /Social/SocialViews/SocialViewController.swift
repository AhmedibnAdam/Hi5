//
//  SocialViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/11/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISocialViewController: class {
	var router: ISocialRouter? { get set }
}

class SocialViewController: UIViewController {
	var interactor: ISocialInteractor?
	var router: ISocialRouter?
    
    //MARK: - Properties
    
    var delegate: SocialControllerDelegate?
    
    lazy var buttonSlideBar: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "menu"), style: .done, target: self, action: #selector(sideMenu))
    }()
    
    @objc func sideMenu() {
        delegate?.handleMenuToggle()
    }

    //MARK: - ViewlifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
}

//MARK: - Extensions
extension SocialViewController: ISocialViewController {
	// do someting...
}

extension SocialViewController {
	// do someting...
}

extension SocialViewController {
    func setupNavigationBar() {
        navigationItem.title = "Social"
        navigationItem.setLeftBarButton(buttonSlideBar, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
        
}



