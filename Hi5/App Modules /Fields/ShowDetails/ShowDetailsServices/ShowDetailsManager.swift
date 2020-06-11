//
//  ShowDetailsManager.swift
//  Hi5
//
//  Created by Mohamed Gamal on 2/22/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol IShowDetailsManager: class {
    func showDetailsFromApi(id: String ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: ShowDetailsModel.FieldDetails?)->Void)
    func requestMemberShipFromApi(id: Int ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: ShowDetailsModel.RequestMemberShipResponse?)->Void)
    func cancelRequestMemberShipFromApi(id: Int ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: ShowDetailsModel.RequestMemberShipResponse?)->Void)
    func addFavouriteFromApi(fieldId: Int ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: FieldsModel.AddfavouriteResponse?)->Void)
      func removeFavouriteFromApi(fieldId: Int ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool,_ data: FieldsModel.RemovefavouriteResponse?)->Void)
}

class ShowDetailsManager: IShowDetailsManager {
    func cancelRequestMemberShipFromApi(id: Int, complition: @escaping (ErrorModel?, Bool, ShowDetailsModel.RequestMemberShipResponse?) -> Void) {
        NetworkService.share.request(endpoint: ShowDetailsFieldsEndpoint.cancelRequestMemberShip(id: id), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(ShowDetailsModel.RequestMemberShipResponse.self, from: response)
                print(user)
                complition(nil , true , user)

            } catch let error {
                print("error : ", error.localizedDescription  )

                do {
                    let decoder = JSONDecoder()
                    let error = try decoder.decode(ErrorModel.self, from: responseData )
                    print(error)
                    complition(error , false , nil)
                } catch let error {
                    print(error)

                }
        }

    }, failure: { (error) in
            do {
                let decoder = JSONDecoder()
                let error = try decoder.decode(ErrorModel.self, from: error as! Data )
                print(error)
                complition(error , false , nil)

            } catch let error {
                print(error)
                complition(nil , false , nil)
            }

        })
    }
    
   
    
 

    
    func showDetailsFromApi(id: String, complition: @escaping (ErrorModel?, Bool, ShowDetailsModel.FieldDetails?) -> Void) {
        NetworkService.share.request(endpoint: ShowDetailsFieldsEndpoint.showDetails(id: id), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(ShowDetailsModel.FieldDetails.self, from: response)
                print(user)
                complition(nil , true , user)

            } catch let error {
                print("error : ", error.localizedDescription  )

                do {
                    let decoder = JSONDecoder()
                    let error = try decoder.decode(ErrorModel.self, from: responseData )
                    print(error)
                    complition(error , false , nil)
                } catch let error {
                    print(error)

                }
        }

    }, failure: { (error) in
            do {
                let decoder = JSONDecoder()
                let error = try decoder.decode(ErrorModel.self, from: error as! Data )
                print(error)
                complition(error , false , nil)

            } catch let error {
                print(error)
                complition(nil , false , nil)
            }

        })
    }
    
  
    
    func requestMemberShipFromApi(id: Int, complition: @escaping (ErrorModel?, Bool, ShowDetailsModel.RequestMemberShipResponse?) -> Void) {
        NetworkService.share.request(endpoint: ShowDetailsFieldsEndpoint.requestMemberShip(id: id), success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(ShowDetailsModel.RequestMemberShipResponse.self, from: response)
                print(user)
                complition(nil , true , user)

            } catch let error {
                print("error : ", error.localizedDescription  )

                do {
                    let decoder = JSONDecoder()
                    let error = try decoder.decode(ErrorModel.self, from: responseData )
                    print(error)
                    complition(error , false , nil)
                } catch let error {
                    print(error)

                }
        }

    }, failure: { (error) in
            do {
                let decoder = JSONDecoder()
                let error = try decoder.decode(ErrorModel.self, from: error as! Data )
                print(error)
                complition(error , false , nil)

            } catch let error {
                print(error)
                complition(nil , false , nil)
            }

        })
    }

   func removeFavouriteFromApi(fieldId: Int, complition: @escaping (ErrorModel?, Bool, FieldsModel.RemovefavouriteResponse?) -> Void) {
           NetworkService.share.request(endpoint: FieldsEndpoint.removeFavourite(fieldId: fieldId), success: { (responseData) in
           let response = responseData
           do {
               let decoder = JSONDecoder()
               let user = try decoder.decode(FieldsModel.RemovefavouriteResponse.self, from: response)
               print(user)
               complition(nil , true , user)
               
           } catch let error {
               print("error : ", error.localizedDescription  )
               
               do {
                   let decoder = JSONDecoder()
                   let error = try decoder.decode(ErrorModel.self, from: responseData )
                   print(error)
                   complition(error , false , nil)
               } catch let error {
                   print(error)
                   
               }
       }
           
   }, failure: { (error) in
           do {
               let decoder = JSONDecoder()
               let error = try decoder.decode(ErrorModel.self, from: error as! Data )
               print(error)
               complition(error , false , nil)
               
           } catch let error {
               print(error)
               complition(nil , false , nil)
           }
           
       })
   }
   
   func addFavouriteFromApi(fieldId: Int ,complition: @escaping (ErrorModel?, Bool, FieldsModel.AddfavouriteResponse?) -> Void) {
           NetworkService.share.request(endpoint: FieldsEndpoint.addFavourite(fieldId: fieldId), success: { (responseData) in
           let response = responseData
           do {
               let decoder = JSONDecoder()
               let user = try decoder.decode(FieldsModel.AddfavouriteResponse.self, from: response)
               print(user)
               complition(nil , true , user)
               
           } catch let error {
               print("error : ", error.localizedDescription  )
               
               do {
                   let decoder = JSONDecoder()
                   let error = try decoder.decode(ErrorModel.self, from: responseData )
                   print(error)
                   complition(error , false , nil)
               } catch let error {
                   print(error)
                   
               }
       }
           
   }, failure: { (error) in
           do {
               let decoder = JSONDecoder()
               let error = try decoder.decode(ErrorModel.self, from: error as! Data )
               print(error)
               complition(error , false , nil)
               
           } catch let error {
               print(error)
               complition(nil , false , nil)
           }
           
       })
   }

}
