//
//  CheckOutSessionDetailsViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICheckOutSessionDetailsViewController: class {
	var router: ICheckOutSessionDetailsRouter? { get set }
    func showAlert(title: String, msg: String)
}

class CheckOutSessionDetailsViewController: UIViewController {
	var interactor: ICheckOutSessionDetailsInteractor?
	var router: ICheckOutSessionDetailsRouter?
    
    //MARK:- Properties
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(backBtntapped))
    }()
    
    @objc func backBtntapped() {
        dismiss(animated: true, completion: nil)
    }
    //MARK: - Outlets
    @IBOutlet weak var cashContainerView: UIView!
    @IBOutlet weak var walletContainerView: UIView!
    @IBOutlet weak var promocodeContainerView: UIView!
    
    //MARK: - ViewLifeCycle
	override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        initView()
    }
    //MARK: - Actions
    @IBAction func proceesBtnTapped(_ sender: UIButton) {
        router?.navigateToWalletSuccessCheckOut()
    }
    
}

//MARK: - Extensions
extension CheckOutSessionDetailsViewController: ICheckOutSessionDetailsViewController {
    func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
}

//MARK: - Extension Initialization
extension CheckOutSessionDetailsViewController {
    func setupNavigationBar() {
        navigationItem.title = "CheckOut"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func initView() {
//        self.promocodeContainerView = CreateCornerRauis.viewRaduis(view: self.promocodeContainerView, number: 5)
//        self.cashContainerView = CreateCornerRauis.viewRaduis(view: self.cashContainerView, number: 5)
//        self.walletContainerView = CreateCornerRauis.viewRaduis(view: self.walletContainerView, number: 5)
        
    }
}

