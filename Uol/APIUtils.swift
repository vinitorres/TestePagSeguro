//
//  APIUtils.swift
//  Uol
//
//  Created by Vinicius Torres on 09/08/17.
//  Copyright © 2017 Vinicius Torres. All rights reserved.
//

import UIKit
import Alamofire

class APIUtils: NSObject {
    
    private static let URL_BASE_CLIENTE = "https://api.punkapi.com/v2/"
    
    private static let URL_GET_BEERS = "beers"
    
    static func getAllBeers(callback: @escaping (DataResponse<Any>) -> ()) {
        
        let url = URL_BASE_CLIENTE + URL_GET_BEERS
        
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { response in
            
            callback(response)
            
        })
        
    }
    
}
