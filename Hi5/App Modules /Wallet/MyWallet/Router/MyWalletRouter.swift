//
//  MyWalletRouter.swift
//  Hi5
//
//  Created by Adam on 4/17/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyWalletRouter: class {
    func navigateToTabBar()
}

class MyWalletRouter: IMyWalletRouter {
    weak var view: MyWalletViewController?
    
    init(view: MyWalletViewController?) {
        self.view = view
    }
    func navigateToTabBar() {
        view?.navigate(type: .modal, module: GeneralRoute.tabBar, completion: nil)
    }
}
