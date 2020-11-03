//
//  HomeViewModel.swift
//  pruebaCeiba
//
//  Created by IMac on 02/11/20.
//

import Foundation
import ObjectMapper

class PostViewModel {
    struct Cells {
        let post="PostCollectionViewCell"
    }
    let cells = Cells()
    private let managerCore = CoreDataManager()
    var posts = [Post]()
    let services = Services()
    typealias CellModel =  (cell:String,obj:Post?,height:Int)
    var container = [CellModel]()
    let endpoints = EndPoints()
    var user = User()
    func initViewModel() {
        
    }
    func getPosts(susses: @escaping ()->(),failed: @escaping ()->() ) {
        
        if(managerCore.findPosts(userId: user.id).count>0){
            posts = self.managerCore.findPosts(userId: user.id)
            print("Posts de usuario \( posts.count)")
            loadData()
            susses()
        }
        else{
            services.get(url: "\(endpoints.post)?userId=\(user.id)") { (res) in
                
                let response = res as? [[String:Any]] ?? [[:]]
               let postsModel =  Mapper<PostModel>().mapArray(JSONObject: (response))!
                self.managerCore.savePosts(posts: postsModel) {
                    self.posts = self.managerCore.findPosts(userId: self.user.id)
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
    
    
    func loadData(){
        container.removeAll()
        posts.forEach { (post) in
            container.append((cells.post,post,90))
        }
    }
    
    
}
