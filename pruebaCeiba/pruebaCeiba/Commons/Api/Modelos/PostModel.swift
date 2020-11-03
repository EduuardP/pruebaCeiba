//
//  PostModel.swift
//  pruebasNapoleon
//
//  Created by IMac on 29/10/20.
//

import Foundation
import ObjectMapper


class PostModel: Mappable {
    var id:Int16 = 0
    var userId:Int16 = 0
    var title = ""
    var body = ""
    var read = true
    var favorite = false
    
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        userId <- map["userId"]
        title <- map["title"]
        body <- map["body"]
        read <- map["read"]
        favorite <- map["favorite"]
    }
   
    
}
