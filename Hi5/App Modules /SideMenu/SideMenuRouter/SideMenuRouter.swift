//
//  SideMenuRouter.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ISideMenuRouter: class {
    func navigatetoProfile(param: [String :Any], id: Int)
    func navigateToFields()
    func navigateToLogin()
    func navigateToMyBookings()
    func navigateToSechadule()
    func navigateToSuggestedField()
    func navigatetoMyWallet()
}
class SideMenuRouter: ISideMenuRouter {

  


    weak var view: SideMenuViewController?
    
    init(view: SideMenuViewController?) {
        self.view = view
    }
    func navigatetoProfile(param: [String : Any], id: Int) {
        view?.navigate(type: .modal, module: GeneralRoute.profile(param: ["":""], id: 0), completion: nil)
     }
     func navigateToFields() {
         view?.navigate(type: .modalWithNavigation, module: GeneralRoute.fields, completion: nil)
     }
     func navigateToLogin() {
         view?.navigate(type: .modal, module: GeneralRoute.login, completion: nil)
     }
     func navigateToMyBookings() {
         view?.navigate(type: .modalWithNavigation, module: GeneralRoute.myBooking, completion: nil)
       }
       func navigateToSechadule() {
         view?.navigate(type: .modalWithNavigation, module: GeneralRoute.mySechadule, completion: nil)
       }
     func navigateToSuggestedField(){
         view?.navigate(type: .modalWithNavigation, module: GeneralRoute.suggestField, completion: nil)
     }
       func navigatetoMyWallet() {
           view?.navigate(type: .modalWithNavigation, module: GeneralRoute.MyWallet, completion: nil)
       }
       
      
    
      
}
