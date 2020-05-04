//
//  MyWalletPresenter.swift
//  Hi5
//
//  Created by Adam on 4/17/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyWalletPresenter: class {
    func showWalletResponse(response: MyWalletModel.Wallet)
    func showErrorAlert(title: String, msg: String)
}

class MyWalletPresenter: IMyWalletPresenter {
    weak var view: IMyWalletViewController?
    
    init(view: IMyWalletViewController?) {
        self.view = view
    }
    func showWalletResponse(response: MyWalletModel.Wallet) {
           view?.showWalletResponse(response: response)
       }
       
       func showErrorAlert(title: String, msg: String) {
           view?.showErrorAlert(title: title, msg: msg)
       }
}
