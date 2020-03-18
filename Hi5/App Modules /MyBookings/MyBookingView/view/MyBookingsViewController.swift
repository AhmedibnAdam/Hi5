//
//  MyBookingsViewController.swift
//  Hi5
//
//  Created by Adam on 3/18/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyBookingsViewController: class {
	var router: IMyBookingsRouter? { get set }
}

class MyBookingsViewController: UIViewController {
    

    var interactor: IMyBookingsInteractor?
    var router: IMyBookingsRouter?
  
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtntapped))
    }()
    
    @objc func backBtntapped() {
     //   router?.navigateToTabBar()
    }
    //MARK: - Outlets

    
    //MARK: - viewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }
    
}

extension MyBookingsViewController: IMyBookingsViewController {
}

extension MyBookingsViewController {
    
}

extension MyBookingsViewController {
 
    func setupNavigationBar() {
        navigationItem.title = "My Booking"
        let button = UIButton(type: .system)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
        button.sizeToFit()
        button.tintColor = .black
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }

}

