//
//  APIUrls.swift
//  Contacts App
//
//  Created by Purushottam Chandra on 19/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import Foundation

enum APIUrls: String {
    
    case url1 = ""
    
    func returnURL() -> String {
        return NetworkConstants.baseURL + rawValue
    }
}

