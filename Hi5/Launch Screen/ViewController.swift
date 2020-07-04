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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.00001) {
            let defaults = UserDefaults.standard
            if (defaults.string(forKey: "Token") != nil){
                
                self.navigate(type: .modal, module: GeneralRoute.tabBar, completion: nil)
                
            } else {
                self.navigate(type: .modal, module: GeneralRoute.enterance, completion: nil)
            }
        }
       
    }

    
    override func viewWillAppear(_ animated: Bool) {
        

    }
    

}

