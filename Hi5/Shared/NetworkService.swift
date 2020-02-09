//
//  NetworkService.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright (c) 2019 FudexApp. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import Foundation
import Alamofire
import SwiftyJSON

protocol IEndpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameter: Parameters? { get }
    var header: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}

class NetworkService {
    static let share = NetworkService()
    
    private var dataRequest: DataRequest?
   // private var uploadRequest: UploadRequest?
    private var success: ((_ data: Data?)->Void)?
    private var failure: ((_ error: Error?)->Void)?
    
    @discardableResult
    private func _dataRequest(
        url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)
        -> DataRequest {
            return SessionManager.default.request(
                url,
                method: method,
                parameters: parameters,
                encoding: encoding,
                headers: headers
            )
    }
    
    func request<T: IEndpoint>(endpoint: T, success: ((_ data: Data)->Void)? = nil, failure: ((_ error: Error?)->Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            self.dataRequest = self._dataRequest(url: endpoint.path,
                                                 method: endpoint.method,
                                                 parameters: endpoint.parameter,
                                                 encoding: endpoint.encoding,
                                                 headers: endpoint.header)
            self.dataRequest?.responseData(completionHandler: { (response) in                
                switch response.result {
                case .success (let value):
                    success?(value)
                case .failure(let error):
                    print(error)
                }

            })
//            self.dataRequest?.responseJSON(completionHandler: { (response) in
//
//                 let statusCode = response.response?.statusCode
//                print(statusCode!)
//
//                switch response.result {
//                case .success(let value):
//                    success?(JSON(value))
//                case .failure(let error):
//                    print(error)
//                }
//            })
        }
    }
    
    func cancelRequest(_ completion: (()->Void)? = nil) {
        dataRequest?.cancel()
        completion?()
    }
    
    func cancelAllRequest(_ completion: (()->Void)? = nil) {
        dataRequest?.session.getAllTasks(completionHandler: { (tasks) in
            tasks.forEach({ (task) in
                task.cancel()
            })
        })
        completion?()
    }
    
    func success(_ completion: ((_ data: Data?)->Void)?) -> NetworkService {
        success = completion
        return self
    }
    
    func failure(_ completion: ((_ error: Error?)->Void)?) -> NetworkService {
        failure = completion
        return self
    }
}

//extension NetworkService {
//
//    private func uploadToServerWith<T: IEndpoint>(endpoint: T, success: ((_ data: Data)->Void)? = nil, failure: ((_ error: Error?)->Void)? = nil) {
//        DispatchQueue.global(qos: .background).async {
//            self.uploadRequest = self._dataRequest(url: endpoint.path,
//                                                   method: endpoint.method,
//                                                   parameters: endpoint.parameter,
//                                                   encoding: endpoint.encoding,
//                                                   headers: endpoint.header)
//            upload(multipartFormData: { (mul) in
//                mul.append(data.data, withName: data.name, fileName: data.fileName, mimeType: data.mimeType)
//                guard let parameters = parameters else { return }
//                for (key, value) in parameters {
//                    mul.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
//                }
//            }, with: uploadRequest) { (response) in
//                switch response {
//                case .success(let requestUp, _, _):
//                    requestUp.responseData(completionHandler: { (response) in
//                        switch response.result {
//                        case .success (let value):
//                            success?(value)
//                        case .failure(let error):
//                            print(error)
//                        }
//                    })
//                }
//            }
//        }
//    }
//}
