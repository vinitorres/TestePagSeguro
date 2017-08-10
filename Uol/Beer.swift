//
//  Beer.swift
//  Uol
//
//  Created by Vinicius Torres on 09/08/17.
//  Copyright © 2017 Vinicius Torres. All rights reserved.
//

import UIKit
import SwiftyJSON

class Beer: NSObject {
    
    var image_url: String?
    var name: String?
    var tagline: String?
    var abv: String?
    var ibu: String?
    var descriptionBeer: String?
    
    override init() {

    }
    
    init(json: JSON) {
        self.image_url = json["image_url"].stringValue
        self.name = json["name"].stringValue
        self.tagline = json["tagline"].stringValue
        self.abv = json["abv"].stringValue
        self.ibu = json["ibu"].stringValue
        self.descriptionBeer = json["description"].stringValue

    }

}
