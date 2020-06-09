//
//  ProfileInteractor.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol IProfileInteractor: class {
	var parameters: [String: Any]? { get set }
    func doShowProfile(id: Int , lat: Double , long: Double)
    func showPlyerProfile(id: Int )
    func showUsrerProfile()
}

class ProfileInteractor: IProfileInteractor {
    var presenter: IProfilePresenter?
    var manager: IProfileManager?
    var parameters: [String: Any]?

    init(presenter: IProfilePresenter, manager: IProfileManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func doShowProfile(id: Int , lat: Double , long: Double){
        manager?.showProfileFromApi(id: id, lat: lat, long: long, complition: { (error, success , data) in
            if (success == true) {
                self.presenter?.hideIndecator()
                guard let data = data else {
                    return 
                }
                self.presenter?.showPartnerResponse(data: data)
            } else {
                self.presenter?.hideIndecator()
                self.presenter?.showErrorAlert(title: "\(error?.code ?? 400)", msg: (error?.message ?? "error"))
            }
        })
    }
    
    func showUsrerProfile(){
        manager?.showUserProfileFromApi( complition: { (error, success , data) in
            if (success == true) {
                self.presenter?.hideIndecator()
                guard let data = data else {
                    return
                }
                self.presenter?.showResponse(data: data)
            } else {
                self.presenter?.hideIndecator()
                self.presenter?.showErrorAlert(title: "\(error?.code ?? 400)", msg: (error?.message ?? "error"))
            }
        })
    }
    func showPlyerProfile(id: Int ){
        manager?.showPlayerFromApi(id: id) { (error, success , data) in
                     if (success == true) {
                         self.presenter?.hideIndecator()
                         guard let data = data else {
                             return
                         }
                         self.presenter?.showPlayerResponse(data: data)
                     } else {
                         self.presenter?.hideIndecator()
                        self.presenter?.showFullPlayerResponse(data: error!)
//                         self.presenter?.showErrorAlert(title: "\(error?.code ?? 400)", msg: (error?.message ?? "error"))
                     }
        }
      }
}
