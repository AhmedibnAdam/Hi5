//
//  WalletSuccessCheckOutViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/9/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IWalletSuccessCheckOutViewController: class {
	var router: IWalletSuccessCheckOutRouter? { get set }
}

class WalletSuccessCheckOutViewController: UIViewController {
	var interactor: IWalletSuccessCheckOutInteractor?
	var router: IWalletSuccessCheckOutRouter?
    
    //MARK: - Properties
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtntapped))
    }()
    
    @objc func backBtntapped() {
        dismiss(animated: true, completion: nil)
    }
    //MARK: - Outlets
    
    
    //MARK: - ViewLifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
		setupNavigationBar()
    }
    //MARK: - Actions
}

//MARK: - Extensions
extension WalletSuccessCheckOutViewController: IWalletSuccessCheckOutViewController {
	// do someting...
}

extension WalletSuccessCheckOutViewController {
	func setupNavigationBar() {
        navigationItem.title = "CheckOut"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}

extension WalletSuccessCheckOutViewController {
	// do someting...
}
