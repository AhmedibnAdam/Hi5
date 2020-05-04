//
//  MyWalletInteractor.swift
//  Hi5
//
//  Created by Adam on 4/17/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyWalletInteractor: class {
    var parameters: [String: Any]? { get set }
     func showWallet(view: UIViewController)
}

class MyWalletInteractor: IMyWalletInteractor {
    var presenter: IMyWalletPresenter?
    var manager: IMyWalletManager?
    var parameters: [String: Any]?

    init(presenter: IMyWalletPresenter, manager: IMyWalletManager) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func showWallet(view: UIViewController) {
        manager?.getMyWallet(complition: { (error, success, response) in
             if (success == true){
                 guard let response = response else {return}
                 self.presenter?.showWalletResponse(response: response)
             } else {
                 self.presenter?.showErrorAlert(title: "Error", msg: "Something Wrong")
             }
         })
     }
}
