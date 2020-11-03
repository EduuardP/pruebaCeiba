//
//  Services.swift
//  pruebaCeiba
//
//  Created by IMac on 02/11/20.
//

import Foundation
import Alamofire

class Services {
    let baseUrl="https://jsonplaceholder.typicode.com/"
    let production:Bool=true
    
    
    
    func get(url:String,susses: @escaping (Any)->(),failed: @escaping (String)->()){
        if NetworkReachabilityManager()!.isReachable {
           
            //let urlString = "\(baseUrl)\(url)"
            let urlString = baseUrl + url
            let headers = [
                "Content-Type":"application/json"
            ]
            Alamofire.request(urlString, method: .get,headers: headers).responseJSON { response in
                
                switch(response.result) {
                    
                case .success(_):
                    
                    if let value = response.result.value{
                        
                        susses(value as Any)
                        
                    }
                    break
                    
                case .failure(_):
                    
                    failed("Error en el servicio")
                    break
                    
                }
                
            }
        }else{
            failed("No hay conexión a internet")
        }
    }
}
