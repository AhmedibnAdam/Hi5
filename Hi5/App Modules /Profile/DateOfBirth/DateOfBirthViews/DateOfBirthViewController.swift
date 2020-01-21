//
//  DateOfBirthViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/21/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IDateOfBirthViewController: class {
	var router: IDateOfBirthRouter? { get set }
}

class DateOfBirthViewController: UIViewController {
	var interactor: IDateOfBirthInteractor?
	var router: IDateOfBirthRouter?
    
    lazy var backBtn: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(named: "leftArrow"), style: .done, target: self, action: #selector(dismissView))
    }()
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }

	override func viewDidLoad() {
        super.viewDidLoad()
		setupNavigationBar()
    }
}

extension DateOfBirthViewController: IDateOfBirthViewController {
	// do someting...
}

extension DateOfBirthViewController {
    func setupNavigationBar() {
        navigationItem.title = "Date Of Birth"
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}

extension DateOfBirthViewController {
	// do someting...
}
