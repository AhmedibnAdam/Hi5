//
//  MyBookingsInteractor.swift
//  Hi5
//
//  Created by Adam on 3/18/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IMyBookingsInteractor: class {
    var parameters: [String: Any]? { get set }
    func getPastBookings(view: UIViewController)
    func getUpCommingBookings(view: UIViewController)
    func getCancelBookings(view: UIViewController)
}

class MyBookingsInteractor: IMyBookingsInteractor {


    var presenter: IMyBookingsPresenter?
    var manager: IMyBookingsManager?
    var parameters: [String: Any]?

    init(presenter: IMyBookingsPresenter, manager: IMyBookingsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
extension MyBookingsInteractor {
    func getPastBookings(view: UIViewController) {
        
    }
    
    func getUpCommingBookings(view: UIViewController) {
        manager?.getUpCommingBookingsFromApi(complition: { (error, success, response) in
            if (success == true) {
               
                  guard let response = response else {return}
                   self.presenter?.showResponse(response: response)
                if (response.fields?.count == 0){
//                      self.presenter?.showResponse(response: response)
                  }
                } else {
          
                    self.presenter?.showErrorAlert(title: "Error", msg: "SomeThing Wrong")
                }
        })
    }
    
    func getCancelBookings(view: UIViewController) {
            manager?.getPastBookingsFromApi(complition: { (error, success, response) in
                if (success == true) {
                   
                      guard let response = response else {return}
                       self.presenter?.showResponse(response: response)
                    if (response.fields?.count == 0){
    //                      self.presenter?.showResponse(response: response)
                      }
                    } else {
              
                        self.presenter?.showErrorAlert(title: "Error", msg: "SomeThing Wrong")
                    }
            })
        }
    
}
