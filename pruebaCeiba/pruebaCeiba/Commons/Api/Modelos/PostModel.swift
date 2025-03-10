//
//  PostModel.swift
//  pruebaCeiba
//
//  Created by IMac on 02/11/20.
//

import Foundation
import ObjectMapper


class PostModel: Mappable {
    var id:Int16 = 0
    var userId:Int16 = 0
    var title = ""
    var body = ""
    
    
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        userId <- map["userId"]
        title <- map["title"]
        body <- map["body"]
        
    }
   
    
}
