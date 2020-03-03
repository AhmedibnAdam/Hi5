//
//  WelcomeViewController.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IWelcomeViewController: class {
	var router: IWelcomeRouter? { get set }
}

class WelcomeViewController: UIViewController {
	var interactor: IWelcomeInteractor?
	var router: IWelcomeRouter?
    //MARK:- Outlets
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var fullnameLbl: UILabel!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var containerView2: UIView!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var containerView4: UIView!
    @IBOutlet weak var containerView3: UIView!
    @IBOutlet weak var containerView1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configer()
        fetchFullName()
        fetchUsername()
		
    }
    //MARK:- Actions
    @IBAction func backBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        router?.navigateToCreatePassword()
    }
    
    @IBAction func changeUsernameBtnTapped(_ sender: UIButton) {
        router?.navigateToChangeUsername()
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        router?.navigateToLogin()
    }
}

//MARK:- extensions
extension WelcomeViewController: IWelcomeViewController {

}

extension WelcomeViewController {
    func configer(){
        router = WelcomeRouter(view: self)
    }
    
    func fetchFullName() {
        let defaults = UserDefaults.standard
        let fullName = defaults.string(forKey: "FullName")
        fullnameLbl.text = fullName
    }
    
    func fetchUsername() {
        let defaults = UserDefaults.standard
        guard let userName = defaults.string(forKey: "UserName") else {return}
        descriptionLbl.text = "Hi \(String(describing: userName)) Find friends, create trainings and participate in matches. You can change your username at any time."
    }    
    
}


