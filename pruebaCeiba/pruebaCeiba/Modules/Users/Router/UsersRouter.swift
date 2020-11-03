//
//  UsersRouter.swift
//  pruebaCeiba
//
//  Created by IMac on 30/10/20.
//

import Foundation
import UIKit

extension UsersViewController{
    static func instantiate() -> UsersViewController {
        let storyboard = UIStoryboard(name: "Users", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! UsersViewController
        return vc
    }
    
    static func navigation() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Users", bundle: Bundle.main)
        let navigationController:UINavigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        return navigationController
    }
    
    func irPosts(user:User) {
        
        let vc = PostViewController.instantiate()
        vc.viewModel.user = user
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
