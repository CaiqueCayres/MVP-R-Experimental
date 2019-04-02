//
//  Network.swift
//  MVPR Example
//
//  Created by Carlos Henrique Cayres on 13/01/19.
//  Copyright © 2019 MBLabs. All rights reserved.
//

import Foundation
import Alamofire


class Network {

    class func request<T>(request: NetworkRequest, completion: @escaping (Result<T>) -> Void) where T: Codable {


        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(request.endpoint,
                          method: request.method,
                          parameters: request.parameters,
                          encoding: request.enconding,
                          headers: request.header).responseData { response in
                          UIApplication.shared.isNetworkActivityIndicatorVisible = false

                            let code = response.response?.statusCode ?? 0

                            switch response.result {
                            case let .success(data):

                                switch code {
                                case 200, 201:

                                    do {
                                        let object = try JSONDecoder().decode(T.self, from: data)
                                        completion(.success(object))
                                    } catch {
                                        completion(.failure(error))
                                    }

                                default:
                                    break
                                }

                            case let .failure(error):
                                completion(.failure(error))
                            }
        }
    }
}

