//
//  PhoneVerificationInteractor.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


import UIKit

protocol IPhoneVerificationInteractor: class {
	var parameters: [String: Any]? { get set }
    func doPhoneVerification(view : UIViewController , code: String)
    func doResendVerificationCode(view : UIViewController)
     func doSendVerificationCode(view : UIViewController)
    func doSendphone(phone: String)
}

class PhoneVerificationInteractor: IPhoneVerificationInteractor {
    var presenter: IPhoneVerificationPresenter?
    var manager: IPhoneVerificationManager?
    var parameters: [String: Any]?

    init(presenter: IPhoneVerificationPresenter, manager: IPhoneVerificationManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    
    func doPhoneVerification(view: UIViewController, code: String) {
        manager?.PhoneVerificationFromApi(code: code, complition: { (error, succes) in
            if (succes == true) {
                self.presenter?.navigateToProfile()
            } else {
                self.presenter?.showErrorAlert(title: "Alert", msg: "sorry code verification not matach the code sent")
            }
        })
    }
    
    func doResendVerificationCode(view: UIViewController) {
        manager?.ResendVerificationCodeFromApi(complition: { (error, succes) in
            if (succes == true) {
                self.presenter?.hideIndicator()
                print("Done Resend Verification Code......")
            } else {
                self.presenter?.hideIndicator()
                self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
            }
        })
    }
    func doSendVerificationCode(view: UIViewController) {
         manager?.sendVerificationCodeFromApi(complition: { (error, succes) in
             if (succes == true) {
                 self.presenter?.hideIndicator()
                 print("Done Resend Verification Code......")
             } else {
                 self.presenter?.hideIndicator()
                 self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
             }
         })
     }
    
    func doSendphone(phone: String) {
        manager?.phone(phone: phone ,complition: { (error, succes) in
                if (succes == true) {
                    self.presenter?.hideIndicator()
                    print("Done send phone number Code......")
                } else {
                    self.presenter?.hideIndicator()
                    self.presenter?.showErrorAlert(title: "Error", msg: "phone not sent")
                }
            })
        }
}
