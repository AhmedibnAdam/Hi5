//
//  ViewController.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright © 2019 FudexApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var parameters = [String: Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.00001) {
            let defaults = UserDefaults.standard
            if (defaults.string(forKey: "Token") != nil){
                let defaults = UserDefaults.standard
                let device_token = defaults.string(forKey: "firebase_token")
                self.parameters["device_token"] = device_token
                self.sendDeviceIdToApi(parameters: self.parameters) { (error, success) in
                    print(success)
                     self.navigate(type: .modal, module: GeneralRoute.tabBar, completion: nil)
                }
               
                
            } else {
                self.navigate(type: .modal, module: GeneralRoute.enterance, completion: nil)
            }
        }
       
    }

    
    override func viewWillAppear(_ animated: Bool) {
        

    }
    
    func sendDeviceIdToApi(parameters:[String: Any], complition: @escaping (ErrorModel?, Bool) -> Void) {
            NetworkService.share.request(endpoint: launchEndpoint.deviceToken(parameters: parameters), success: { (responseData) in
            let response = responseData
           
                print(response)
                complition(nil , true)
            
        })
    }

}

