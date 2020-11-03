//
//  CoreDataManager.swift
//  pruebaCeiba
//
//  Created by IMac on 02/11/20.
//


import Foundation
import UIKit
import CoreData
class CoreDataManager {
    private let container : NSPersistentContainer!
    let context: NSManagedObjectContext

    
    init() {
        container = NSPersistentContainer(name: "pruebaCeiba")
        if let appDelegate =
            UIApplication.shared.delegate as? AppDelegate {
            context = appDelegate.persistentContainer.viewContext
            setupDatabase()
        }
        else{
            context = container.viewContext
            setupDatabase()
        }
        
     
    }
    
    private func setupDatabase() {
        container.loadPersistentStores { (desc, error) in
            if let error = error {
                print("Error loading store \(desc) — \(error)")
                return
            }
        print("Database ready!")
        }
    }
    
    func savePosts(posts:[PostModel], completion: @escaping() -> (),failed: @escaping(String) -> ()) {
        

        for (index,item) in posts.enumerated() {
            let post = Post(context: context)
            post.id = item.id
            post.body = item.body
            post.title = item.title
            post.userId = item.userId
            self.save()
        }
        completion()
    
    }
    
    func saveUsers(users:[UserModel], completion: @escaping() -> (),failed: @escaping(String) -> ()) {
        

        for (item) in users {
            let user = User(context: context)
            user.id = item.id
            user.name = item.name
            user.phone = item.phone
            user.email = item.email
            self.save()
        }
        completion()
    
    }
    
    
   /* func getAllPost() -> [Post]  {
            
            let fetchRequest : NSFetchRequest<Post> = Post.fetchRequest()
            do {
               let result = try context.fetch(fetchRequest)
                return result
            } catch {
                print("El error obteniendo los posts \(error)")
             }
        return []
    } */
    
    func getAllUsers() -> [User]  {
            
            let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
            do {
               let result = try context.fetch(fetchRequest)
                return result
            } catch {
                print("El error obteniendo los posts \(error)")
             }
        return []
    }
    
    
   /* func deleteAllPost() {
        
        let posts = getAllPost()
        posts.forEach { (item) in
            context.delete(item)
        }
        save()
    } */
   /* func deletePost(post:Post) {
        context.delete(post)
        save()
    } */
    
    
    func findPosts(userId:Int16) -> [Post] {
        
        let fetchRequest : NSFetchRequest<Post> = Post.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "userId==\(userId)")
        do {
           let result = try context.fetch(fetchRequest)
            return result
        } catch {
            print("El error obteniendo los posts \(error)")
         }
        return []
    }
    
    func save() {
        do {
            try context.save()
            
        } catch {
            print("Error guardando post — \(error)")
          
        }

    }
    

    
    
 
}
