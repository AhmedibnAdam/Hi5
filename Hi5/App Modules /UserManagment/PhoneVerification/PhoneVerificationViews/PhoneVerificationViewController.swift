//
//  PhoneVerificationViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IPhoneVerificationViewController: class {
	var router: IPhoneVerificationRouter? { get set }
}

class PhoneVerificationViewController: UIViewController {
	var interactor: IPhoneVerificationInteractor?
	var router: IPhoneVerificationRouter?
    //MARK: - Outlets
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
		initView()
        configer()
    }
    //MARK: - Actions
    @IBAction func continueBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func resendBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
//MARK: - extensions
extension PhoneVerificationViewController: IPhoneVerificationViewController {
	// do someting...
}

extension PhoneVerificationViewController {
    
    func initView(){
          // MARK : - Button  raduis
        self.continueBtn = CreateCornerRauis.ButtonRaduis(button: self.continueBtn, number: 5)
    }
    
    func configer(){
        router = PhoneVerificationRouter(view: self)
    }
}

