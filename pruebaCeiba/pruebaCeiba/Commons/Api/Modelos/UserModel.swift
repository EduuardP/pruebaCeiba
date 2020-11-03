//
//  UserModel.swift
//  pruebaCeiba
//
//  Created by IMac on 2/11/20.
//

import Foundation
import ObjectMapper
class UserModel: Mappable {
    var id:Int16 = 0
    var name = ""
    var email = ""
    var phone = ""

    
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        phone <- map["phone"]
        
    }
   
    
}
