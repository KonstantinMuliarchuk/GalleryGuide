//
//  WorksVO.swift
//  galleryguide
//
//  Created by Мулярчук Константин on 26.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation
import ObjectMapper


struct WorksVO {
    var id: String!
    var size: String?
    var title: String?
    var imgPicture: GetImageInfo?
    var type: String?
    var year: String?
    var author: String?
    var updated_at: Date?
    var created_at: String?
}


extension WorksVO: Mappable {
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["objectId"]
        author <- map["author"]
        imgPicture <- map["imgPicture"]
        size <- map["size"]
        title <- map["title"]
        type <- map["type"]
        year <- map["year"]
    }
}

struct GetImageInfo: Mappable {
    var type: String?
    var name: String?
    var url: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map){
        type <- map["__type"]
        name <- map["name"]
        url <- map["url"]
    }
    
}

