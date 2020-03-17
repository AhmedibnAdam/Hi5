//
//  ViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright © 2019 FudexApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
        if defaults.string(forKey: "Token") != nil  {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.navigate(type: .modal, module: GeneralRoute.tabBar, completion: nil)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.navigate(type: .modal, module: GeneralRoute.login, completion: nil)
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        

    }
    

}

