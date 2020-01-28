//
//  SearchLocationViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/25/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISearchLocationViewController: class {
	var router: ISearchLocationRouter? { get set }
    func showAlert(title: String, msg: String)
}

class SearchLocationViewController: UIViewController {
	var interactor: ISearchLocationInteractor?
	var router: ISearchLocationRouter?
    
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
        router?.navigateToLocation()
    }
    //MARK:- Outlets
    
    
    //MARK:- View life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        initView()
        configure()
    }
   //MARK:- Actions
    
    
}
//MARK:- Extensions
extension SearchLocationViewController: ISearchLocationViewController {
     func showAlert(title: String, msg: String) {
      ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
}

extension SearchLocationViewController {
    func setupNavigationBar() {
        navigationItem.title = "Search Your Location"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.setRightBarButton(checkMarkBtn, animated: true)
        navigationItem.rightBarButtonItem?.tintColor = .black
//        navigationItem.rightBarButtonItem?.isEnabled = false
//        navigationItem.rightBarButtonItem?.tintColor = UIColor.clear
    }
    func initView() {

    }
    
    func configure() {
        router = SearchLocationRouter(view: self)
    }
}

extension SearchLocationViewController {
	
}
