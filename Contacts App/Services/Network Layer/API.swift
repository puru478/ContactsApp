//
//  API.swift
//  Contacts App
//
//  Created by Purushottam Chandra on 19/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import Foundation

open class API {
    
    public enum Endpoints {
        
        public var header: String {
            switch self {
            default:
                break
            }
        }
        
        public var path: String {
            switch self {
            default:
                break
            }
        }
    }
    
    static func request(_ endpoint: API.Endpoints, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        var request = URLRequest(url: URL(string: endpoint.path)!)
        request.httpMethod = endpoint.header
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            completionHandler(data, response, error)
        })
        return task
    }
}
