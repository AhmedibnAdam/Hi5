//
//  WalletSuccessCheckOutInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/9/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IWalletSuccessCheckOutInteractor: class {
	var parameters: [String: Any]? { get set }
}

class WalletSuccessCheckOutInteractor: IWalletSuccessCheckOutInteractor {
    var presenter: IWalletSuccessCheckOutPresenter?
    var manager: IWalletSuccessCheckOutManager?
    var parameters: [String: Any]?

    init(presenter: IWalletSuccessCheckOutPresenter, manager: IWalletSuccessCheckOutManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
