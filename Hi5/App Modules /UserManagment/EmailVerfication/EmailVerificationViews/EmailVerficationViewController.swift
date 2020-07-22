//
//  EmailVerficationViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import UIKit

protocol IEmailVerficationViewController: class {
	var router: IEmailVerficationRouter? { get set }
}

class EmailVerficationViewController: UIViewController, UITextFieldDelegate {
	var interactor: IEmailVerficationInteractor?
	var router: IEmailVerficationRouter?
    //MARK: - Outlets
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField1.delegate = self
        self.textField2.delegate = self
        self.textField3.delegate = self
        self.textField4.delegate = self
		
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    // MARK: - Actions
    @IBAction func continueBtnTapped(_ sender: Any) {
        showIndicator()
    }
    
    @IBAction func resendBtnTapped(_ sender: Any) {
        showIndicator()
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
//MARK:- extensions
extension EmailVerficationViewController: IEmailVerficationViewController {
	// do someting...
}

extension EmailVerficationViewController {
    func showIndicator() {
        loadingIndicator.isHidden = false
    }
}

