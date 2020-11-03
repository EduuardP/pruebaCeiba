//
//  HomeRouter.swift
//  pruebaCeiba
//
//  Created by IMac on 30/10/20.
//

import Foundation
import UIKit


extension PostViewController{
    
    
    static func instantiate() -> PostViewController {
        let storyboard = UIStoryboard(name: "Post", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! PostViewController
        return vc
    }
    
}
