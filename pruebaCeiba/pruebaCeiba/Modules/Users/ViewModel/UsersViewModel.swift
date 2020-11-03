//
//  UsersViewModel.swift
//  pruebaCeiba
//
//  Created by IMac on 30/10/20.
//

import Foundation
import ObjectMapper
class UsersViewModel {
    
    struct Cells {
        let user="UsersTableViewCell"
    }
    let cells = Cells()
    let services = Services()
    var users = [User]()
    let endpoints = EndPoints()
    private let managerCore = CoreDataManager()
    
    typealias CellModel = (cell:String,obj:User?,height:Int)
    var container = [CellModel]()
    
    
    
    func getUsers(susses: @escaping ()->(),failed: @escaping ()->() ) {
        
        if(managerCore.getAllUsers().count>0){
            self.users = managerCore.getAllUsers()
            susses()
        }
        else{
            services.get(url: endpoints.users) { (res) in
                
                let response = res as? [[String:Any]] ?? [[:]]
               let usersModel =  Mapper<UserModel>().mapArray(JSONObject: (response))!
                self.managerCore.saveUsers(users: usersModel) {
                self.users = self.managerCore.getAllUsers()
                    susses()
                } failed: { (error) in
                    print(error)
                    failed()
                }

            } failed: { (error) in
                failed()
            }
        }
    }
    
    
    func loadData() {
        container.removeAll()
        users.forEach { (user) in
            
            container.append((cells.user,user,90))
            
        }
    }
}
