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
    case showDetailsFields(field_id: String)
    case filter
    case filterResult(param: [String: Any], type:String)
    case myBooking
    case mySechadule
    case publicEvents(event_id: String)
    
    case suggestField
    case suggestFieldDetails(latitude: Double , longitude: Double)
    case fieldOwnerDetails(param: [String: Any] , images: [UIImage])
    case sessionDetails(id: Int , payment: String , sessionId: Int)
    case checkOutSessionDetails(field: PublicEventDetailsModel.PublicEventDetails? , session: SessionDetailsModel.SessionDetailsResponse?)
    case walletSuccessCheckOut
    case MyWallet
    
}

extension GeneralRoute {
    var module: UIViewController? {
        /*
         Setup module with parameters like:
         
         switch self {   case suggestField
              case suggestFieldDetails(latitude: Double , longitude: Double)
              case fieldOwnerDetails(param: [String: Any] , images: [UIImage])
              case sessionDetails(id: Int , payment: String , sessionId: Int)
              case checkOutSessionDetails
              case walletSuccessCheckOut
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
        case .showDetailsFields(let field_id):
            return ShowDetailsConfiguration.setup(field: field_id)
        case .filter:
            return FilterConfiguration.setup()
        case .filterResult(let param , let type):
            return FilterResultConfiguration.setup(parameters: param, type: type)
        case .myBooking:
            return MyBookingsConfiguration.setup()
        case .mySechadule:
            return SechaduleConfiguration.setup()
        
        case .publicEvents(let event_id):
            return PublicEventDetailsConfiguration.setup(field_id: event_id)
            
            
            case .suggestField:
                return SuggestFieldConfiguration.setup()
            case .suggestFieldDetails(let latitude , let longitude):
                return SuggestFieldDetailsConfiguration.setup(latitude: latitude, longitude: longitude)
            case .fieldOwnerDetails(let param , let images):
                return FieldOwnerDetailsConfiguration.setup(param: param, images: images)
            case .sessionDetails(let id , let payment , let sessionId):
                return SessionDetailsConfiguration.setup(id: id, payment: payment , sessionId: sessionId)
            case .checkOutSessionDetails(let field , let session):
                return CheckOutSessionDetailsConfiguration.setup(field: field , session: session)
            case .walletSuccessCheckOut:
                return WalletSuccessCheckOutConfiguration.setup()
        case .MyWallet :
                return MyWalletConfiguration.setup()
        }
    }
}
