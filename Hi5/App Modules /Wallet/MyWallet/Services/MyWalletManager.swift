//
//  MyWalletManager.swift
//  Hi5
//
//  Created by Adam on 4/17/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation

protocol IMyWalletManager: class {
    func getMyWallet( complition: @escaping (ErrorModel?, Bool, MyWalletModel.Wallet?) -> Void)
}

class MyWalletManager: IMyWalletManager {
    func getMyWallet( complition: @escaping (ErrorModel?, Bool, MyWalletModel.Wallet?) -> Void) {
        NetworkService.share.request(endpoint: MyWalletEndpoint.myWallet, success: { (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(MyWalletModel.Wallet.self, from: response)
                print(data)
                complition(nil , true , data)

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
