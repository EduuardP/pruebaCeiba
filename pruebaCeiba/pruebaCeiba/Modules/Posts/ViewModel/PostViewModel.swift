//
//  HomeViewModel.swift
//  pruebaCeiba
//
//  Created by IMac on 02/11/20.
//

import Foundation

class PostViewModel {
    struct Cells {
        let post="PostCollectionViewCell"
    }
    let cells = Cells()
    private let managerCore = CoreDataManager()
    var posts = [Post]()
    typealias CellModel =  (cell:String,obj:Post?,height:Int)
    var container = [CellModel]()
 //   let Container =
    var user = User()
    func initViewModel() {
        
    }
    func getPosts() {
        posts = self.managerCore.findPosts(userId: user.id)
        print("Posts de usuario \( posts.count)")
        loadData()
    }
    
    
    func loadData(){
        container.removeAll()
        posts.forEach { (post) in
            container.append((cells.post,post,90))
        }
    }
    
    
}
