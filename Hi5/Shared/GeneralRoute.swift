//
//  GeneralRoute.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.


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
    case enterance
    case login
    case register
    case terms(url: String)
    case forgetPassword
    case forgetPhone
    case forgetEmail
    case newPassword(phone: String)
    case emailVerification
    case phoneVerification
    case sigupVerificationPhone
    case welcome
    case createPassword(param: [String: Any])
    case changeUsername(param: [String: Any])
    case tabBar
    case profile(param: [String: Any],id: Int)
    case editProfile
    case gender
    case dateOfBirth
    case searchLocation
    case location
    case sideMenu
    case fields
    case showDetailsFields(param: [String: Any], field_id: String)
    case filter(param: [String: Any])
    case filterResult(param: [String: Any], type:String)
    case myBooking
    case bookingDetails(id: Int , type: Int)
    case mySechadule
    case publicEvents(event_id: String)
    case setting
    case suggestField
    case suggestFieldDetails(latitude: Double , longitude: Double)
    case fieldOwnerDetails(param: [String: Any] , images: [UIImage])
    case sessionDetails( param: [String: Any] , id: Int , payment: String , sessionId: Int)
    case checkOutSessionDetails(field: PublicEventDetailsModel.PublicEventDetails? , session: SessionDetailsModel.SessionDetailsResponse?)
    case walletSuccessCheckOut
    case MyWallet
    case comment (parameters: [String: Any])
    case allComments(fieldId: Int)
    case filterBublicEvent(parameters: [String: Any])
    case publicEvent(parameters: [String: Any])
    case receipt
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
        case .enterance:
            return EntranceConfiguration.setup()
        case .login:
            return LoginConfiguration.setup()
        case .register:
            return RegisterConfiguration.setup()
        case .terms(let url):
            return TermsConfiguration.setup(url: url)
        case .setting:
            return SettingConfiguration.setup()
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
        case .createPassword(let params):
            return CreatePasswordConfiguration.setup(parameters: params)
        case .changeUsername(let params):
            return ChangeUsernameConfiguration.setup(parameters: params)
        case .tabBar:
            return TabBarConfiguration.setup()
        case .profile(let param , let id):
            return ProfileConfiguration.setup(parameters: param, id: id)
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
        case .showDetailsFields(let param , let field_id):
            return ShowDetailsConfiguration.setup(parameters: param, field: field_id)
        case .filter(let params ):
            return FilterConfiguration.setup(parameters: params)
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
        case .sessionDetails(let param , let id , let payment , let sessionId):
            return SessionDetailsConfiguration.setup(parameters : param , id: id, payment: payment , sessionId: sessionId)
        case .checkOutSessionDetails(let field , let session):
            return CheckOutSessionDetailsConfiguration.setup(field: field , session: session)
        case .walletSuccessCheckOut:
            return WalletSuccessCheckOutConfiguration.setup()
        case .MyWallet :
            return MyWalletConfiguration.setup()
            
        case .bookingDetails(let id , let type ):
            return BookingDetailsConfiguration.setup( id: id , type: type )
        case .comment(let param):
            return CommentConfiguration.setup(parameters: param)
        case .allComments(let id):
            return AllCommentsConfiguration.setup(fieldId: id)
        case .filterBublicEvent(let param):
            return FilterBublicEventConfiguration.setup(parameters: param)
            
        case .publicEvent(let params):
            return PublicEventsConfiguration.setup(parameters: params)
            
        case .newPassword(let phone):
            return NewPasswordConfiguration.setup(phone: phone)
        case .receipt:
            return ReceiptConfiguration.setup()
        }
       
    }
}
