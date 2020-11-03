//
//  UIViewController.swift
//  pruebaCeiba
//
//  Created by IMac on 30/10/20.
//

import Foundation
import UIKit
import ZVProgressHUD

extension UIViewController{
    
    func showLoading(){
        ZVProgressHUD.maskType = .black
        ZVProgressHUD.show()
    }
    
    func hiddenLoading(){
        ZVProgressHUD.dismiss()
    }
}
