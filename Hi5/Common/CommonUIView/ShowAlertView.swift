//
//  ShowAlertView.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright © 2019 FudexApp. All rights reserved.
//

import Foundation
import UIKit

class ShowAlertView {
    
    class func showAlert (title: String , msg: String , sender: UIViewController){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        
        sender.present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            switch action.style{
            case .default:
               
                    print(msg)
            
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
            @unknown default:
                print("error")
                
            }}))
    }
}
