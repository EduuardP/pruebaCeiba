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
    
    
    
    var posts = [Post]()
    typealias CellModel = (cell:String,obj:Post?,height:Int)
    var container = [CellModel]()
    
    
    
    func getUsers(susses: @escaping ()->(),failed: @escaping ()->() ) {
        
        if(managerCore.getAllPost().count>0){
            susses()
        }
        else{
            services.get(url: endpoints.users) { (res) in
                
                let response = res as? [[String:Any]] ?? [[:]]
               let postsModel =  Mapper<PostModel>().mapArray(JSONObject: (response))!
                self.managerCore.deleteAllPost()
                self.managerCore.savePosts(posts: postsModel) {
                 //   self.posts = self.managerCore.getAllPost()
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
}
