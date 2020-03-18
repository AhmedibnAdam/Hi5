//
//  SideMenuManager.swift
//  Hi5
//
//  Created by Adam on 1/1/20.
//  Copyright (c) 2020 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import UIKit
protocol ISideMenuManager: class {
	// do someting...
    func setImage(urlString:String,completion: @escaping (_ image:UIImage?,_ Error:ErrorModel?) -> () )
}


class SideMenuManager: ISideMenuManager {
    
    var imageCashe = [String:UIImage]()
    var lastURLUsedToLoadImage:String?
    
    func setImage(urlString: String, completion: @escaping (UIImage?, ErrorModel?) -> ()) {
//         if let cachedImage = imageCashe[urlString] {
//            completion(cachedImage,nil)
//         }
//             lastURLUsedToLoadImage = urlString
////        userImage = nil
//             guard let url = URL(string: urlString) else {return}
//                   URLSession.shared.dataTask(with: url) { (data, response, err) in
//                       if let err = err {
//                           print("Failed to fetch post image",err.localizedDescription)
//                           return
//                       }
//                       if url.absoluteString != self.lastURLUsedToLoadImage {
//                           return
//                       }
//                       guard let imageData = data else {return}
//                     guard let photoImage = UIImage(data: imageData) else {return}
//                     self.imageCashe[url.absoluteString] = photoImage
//                       DispatchQueue.main.async {
////                         self.userImage = photoImage
//                        completion(photoImage,nil)
//                       }
//                       }.resume()
    }
    
	// do someting...
    
}
