//
//  SignupPhoneVerificationInteractor.swift
//  Hi5
//
//  Created by Mohamed Gamal on 1/12/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.


import UIKit

protocol ISignupPhoneVerificationInteractor: class {
	var parameters: [String: Any]? { get set }
    func forgetPassword( phone : String)
    func doSignupPhoneVerification(phone : String, code: String)
    func sendCodeAndPhone(phone : String, code: String)
    func doSignupResendVerificationCode(view : UIViewController)
}

class SignupPhoneVerificationInteractor: ISignupPhoneVerificationInteractor {
    var presenter: ISignupPhoneVerificationPresenter?
    var manager: ISignupPhoneVerificationManager?
    var parameters: [String: Any]?

    init(presenter: ISignupPhoneVerificationPresenter, manager: ISignupPhoneVerificationManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
    func doSignupPhoneVerification(phone : String, code: String) {
        manager?.signupPhoneVerificationFromApi(phone : phone , code: code, complition: { (error, succes) in
            if (succes == true) {
                self.presenter?.navigateToCreatePassword()
            } else {
                self.presenter?.showErrorAlert(title: "Error", msg: (error?.message ?? "sorry code verification not matach the code sent")!)
            }
        })
    }
    func forgetPassword( phone : String) {
        manager?.forgerPasswordApi(phone: phone, complition: { (error, succes) in
               if (succes == true) {
//                   self.presenter?.navigateToCreatePassword()
               } else {
                   self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
               }
           })
       }
    
    func doSignupResendVerificationCode(view: UIViewController) {
        manager?.signupResendVerificationCodeFromApi(complition: { (error, succes) in
            if (succes == true) {
                self.presenter?.hideIndicator()
                print("Done Resend Verification Code......")
            } else {
                self.presenter?.hideIndicator()
                self.presenter?.showErrorAlert(title: "\(error?.code! ?? 400)", msg: (error?.message)!)
            }
        })
    }
    func sendCodeAndPhone(phone : String, code: String){
        manager?.sendCodeAndPhoneFromApi(phone: phone, code: code , complition: { (error, sucess) in
            if (sucess == true) {
                self.presenter?.navigateToCreatePassword()
            } else {
                self.presenter?.showErrorAlert(title: "Error", msg: (error?.message ?? "sorry code verification not matach the code sent")!)
            }
        })
    }
}
