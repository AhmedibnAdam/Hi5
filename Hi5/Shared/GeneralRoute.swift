//
//  GeneralRoute.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit

enum GeneralRoute: IRouter {
    /*
     If you want passing with parameters
     you just add like this:
     
     case sample
     case sample(parameter: [String: Any])
     
     you can use: String, Int, [String: Any], etc..
    */
    
    case login
    case register
    case userAccount
    case forgetPassword
    case forgetPhone
    case forgetEmail
    case emailVerification
    case phoneVerification
    case sigupVerificationPhone
    case welcome
    case createPassword
    case changeUsername
    case tabBar
    case profile
    case editProfile
    case gender
    case dateOfBirth
    case searchLocation
    case location
    case sideMenu
    case fields
    case showDetailsFields(field: FieldsModel.NearByfieldsResponseField)
//    case filter
//    case filterResult
}

extension GeneralRoute {
    var module: UIViewController? {
        /*
         Setup module with parameters like:
         
         switch self {
         case .sample:
            return SampleConfiguration.setup()
        case .sample(let parameters):
            return SampleConfiguration.setup(parameters: parameters)
         }
         
         */
        
        switch self {
        case .login:
            return LoginConfiguration.setup()
        case .register:
            return RegisterConfiguration.setup()
        case .userAccount:
            return UserAccountConfiguration.setup()
        case .forgetPassword:
            return ForgetPasswordConfiguration.setup()
        case .forgetPhone:
            return ForgotPhoneConfiguration.setup()
        case .forgetEmail:
            return ForgetEmailConfiguration.setup()
        case .emailVerification:
            return EmailVerficationConfiguration.setup()
        case .phoneVerification:
            return PhoneVerificationConfiguration.setup()
        case .sigupVerificationPhone:
            return SignupPhoneVerificationConfiguration.setup()
        case .welcome:
            return WelcomeConfiguration.setup()
        case .createPassword:
            return CreatePasswordConfiguration.setup()
        case .changeUsername:
            return ChangeUsernameConfiguration.setup()
        case .tabBar:
            return TabBarConfiguration.setup()
        case .profile:
            return ProfileConfiguration.setup()
        case .editProfile:
            return EditProfileConfiguration.setup()
        case .gender:
            return GenderConfiguration.setup()
        case .dateOfBirth:
            return DateOfBirthConfiguration.setup()
        case .searchLocation:
            return SearchLocationConfiguration.setup()
        case .location:
            return LocationConfiguration.setup()
        case .sideMenu:
            return SideMenuConfiguration.setup()
        case .fields:
            return FieldsConfiguration.setup()
        case .showDetailsFields(let field):
            return ShowDetailsConfiguration.setup(field: field)
//        case .filter:
//            return FilterConfiguration.setup()
//        case .filterResult:
//            return FilterResultConfiguration.setup()
        }
    }
}
