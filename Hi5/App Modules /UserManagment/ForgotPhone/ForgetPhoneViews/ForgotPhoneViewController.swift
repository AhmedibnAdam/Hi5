//
//  ForgotPhoneViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IForgotPhoneViewController: class {
	var router: IForgotPhoneRouter? { get set }
}

class ForgotPhoneViewController: UIViewController, UITextFieldDelegate {
	var interactor: IForgotPhoneInteractor?
	var router: IForgotPhoneRouter?
    //MARK:- Outlets
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        self.phoneNumberTextField.delegate = self
		initView()
        configer()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    //MARK: - Actions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueBtnTapped(_ sender: Any) {
        router?.navigateToPhoneVerification()
    }
}
//MARK:- extensions
extension ForgotPhoneViewController: IForgotPhoneViewController {
	// do someting...
}

extension ForgotPhoneViewController {
  func initView(){
      // MARK : - Button  raduis
    self.continueBtn = CreateCornerRauis.ButtonRaduis(button: self.continueBtn, number: 5)
  }
    
func configer(){
    router = ForgotPhoneRouter(view: self)
  }
}

