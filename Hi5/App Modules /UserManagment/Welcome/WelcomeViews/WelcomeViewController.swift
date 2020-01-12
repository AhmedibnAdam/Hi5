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
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var containerView2: UIView!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var containerView4: UIView!
    @IBOutlet weak var containerView3: UIView!
    @IBOutlet weak var containerView1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        configer()
		
    }
    //MARK:- Actions
    @IBAction func backBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        router?.navigateToCreatePassword()
    }
    
    @IBAction func changeUsernameBtnTapped(_ sender: UIButton) {
        
    }
}

//MARK:- extensions
extension WelcomeViewController: IWelcomeViewController {
	// do someting...
}

extension WelcomeViewController {
    func initView(){
        // MARK : - view raduis
        self.logoView = CreateCornerRauis.viewRaduis(view: self.logoView, number: (self.logoView.frame.size.height / 2))
        self.containerView1 = CreateCornerRauis.viewRaduis(view: self.containerView1, number: (self.containerView1.frame.size.height / 2))
        self.containerView2 = CreateCornerRauis.viewRaduis(view: self.containerView2, number: (self.containerView2.frame.size.height / 2))
        self.containerView3 = CreateCornerRauis.viewRaduis(view: self.containerView3, number: (self.containerView3.frame.size.height / 2))
        self.containerView4 = CreateCornerRauis.viewRaduis(view: self.containerView4, number: (self.containerView4.frame.size.height / 2))
          // MARK : - Button  raduis
        self.continueBtn = CreateCornerRauis.ButtonRaduis(button: self.continueBtn, number: 5)
    }
    
    func configer(){
        router = WelcomeRouter(view: self)
    }
}

