//
//  LoginManager.swift
//  Hi5
//
//  Created by Adam on 12/25/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import SwiftyJSON
import UIKit
// MARK: - Handle all data requests and responses API / CoreData / Realm etc ...

protocol ILoginManager: class {
    // MARK : - do someting...
    func loginFromApi(userName: String ,password: String ,complition :  @escaping (_ error:ErrorModel? ,_ success: Bool)->Void)
}

class LoginManager: ILoginManager {
    var imageCashe = [String:UIImage]()
      var lastURLUsedToLoadImage:String?

    // MARK : - do someting...
    func loginFromApi(userName: String ,password: String , complition :  @escaping (_ error:ErrorModel? ,_ success: Bool)->Void) {
        NetworkService.share.request(endpoint: LoginEndpoint.login(userName: userName, password: password), success: {[weak self] (responseData) in
            let response = responseData
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(LoginModel.LoginResponse.self, from: response)
                print(user)
                let defaults = UserDefaults.standard
                if let token = user.token , let username = user.userName , let fullname = user.fullName, let userProfileImage = user.image {
//                    let image = userProfileImage.pngData()
                    defaults.set(token, forKey: "Token")
                    defaults.set(username, forKey: "UserName")
                    defaults.set(fullname, forKey: "FullName")
                    self?.setImage(urlString: userProfileImage)
                }
                complition(nil,true)
                
            } catch let error {
                print("error : ", error.localizedDescription  )
                
                do {
                    let decoder = JSONDecoder()
                    let error = try decoder.decode(ErrorModel.self, from: responseData )
                    print(error)
                    complition(error , false)
                } catch let error {
                    print(error)
                    
                }
        }
            
    }, failure: { (error) in
            do {
                let decoder = JSONDecoder()
                let error = try decoder.decode(ErrorModel.self, from: error as! Data )
                print(error)
                complition(error , false)
                
            } catch let error {
                print(error)
                complition(nil , false)
            }
            
        })
    }
    func setImage(urlString: String) {
             if let cachedImage = imageCashe[urlString] {
                UserDefaults.standard.set(cachedImage, forKey: "image")
             }
                 lastURLUsedToLoadImage = urlString
    //        userImage = nil
                 guard let url = URL(string: urlString) else {return}
                       URLSession.shared.dataTask(with: url) { (data, response, err) in
                           if let err = err {
                               print("Failed to fetch post image",err.localizedDescription)
                               return
                           }
                           if url.absoluteString != self.lastURLUsedToLoadImage {
                               return
                           }
                           guard let imageData = data else {return}
                         guard let photoImage = UIImage(data: imageData) else {return}
                         self.imageCashe[url.absoluteString] = photoImage
                           DispatchQueue.main.async {
    //                         self.userImage = photoImage
                            UserDefaults.standard.set(imageData, forKey: "image")
                           }
                           }.resume()
        }
        
}
