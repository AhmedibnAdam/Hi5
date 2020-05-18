//
//  CheckOutSessionDetailsInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 4/7/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ICheckOutSessionDetailsInteractor: class {
    var parameters: [String: Any]? { get set }
    func joinPublicEvent(view: UIViewController , eventId: String)
    func join(view: UIViewController , eventId: String)
}

class CheckOutSessionDetailsInteractor: ICheckOutSessionDetailsInteractor {
 
    var presenter: ICheckOutSessionDetailsPresenter?
    var manager: ICheckOutSessionDetailsManager?
    var parameters: [String: Any]?

    init(presenter: ICheckOutSessionDetailsPresenter, manager: ICheckOutSessionDetailsManager) {
        self.presenter = presenter
        self.manager = manager
    }
    func joinPublicEvent(view: UIViewController , eventId: String){
        manager?.joinApi(id: eventId,  complition: { (error, success, response) in
            if response == nil {
                self.presenter?.showErrorAlert(title: "Alert", msg: "your request already booked before , or something goes wrong.")
            }
            else{
                self.presenter?.showErrorAlert(title: "Alert", msg: " Booked  ")
          //  self.presenter?.showDetailsResponse(response: response)
            }
        })
    }
    func join(view: UIViewController , eventId: String){
           manager?.bookApi(id: eventId, parameter: parameters! , complition: { (error, success, response) in
               if response == nil {
                   self.presenter?.showErrorAlert(title: "Alert", msg: "your request already booked before , or something goes wrong.")
               }
               else{
                self.presenter?.showErrorAlert(title: "Alert", msg: response?.msg ?? "Error")
             //  self.presenter?.showDetailsResponse(response: response)
               }
           })
       }
}
