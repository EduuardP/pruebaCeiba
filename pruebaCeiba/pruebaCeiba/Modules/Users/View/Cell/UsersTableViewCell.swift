//
//  UsersTableViewCell.swift
//  pruebaCeiba
//
//  Created by IMac on 30/10/20.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var contenido: UIView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblTelefono: UILabel!
    @IBOutlet weak var lblCorreo: UILabel!
    @IBOutlet weak var btnVerPublicaciones: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initCell()
    }

    
    
    func initCell() {
        contenido.layer.shadowColor = UIColor.black.cgColor
        contenido.layer.shadowOpacity = 0.3
        contenido.layer.shadowOffset = .zero
        contenido.layer.shadowRadius = 5
        contenido.layer.cornerRadius = 5
    }
    
    func setup(user:User){
        lblNombre.text = user.name
        lblCorreo.text = user.email
        lblTelefono.text = user.phone
    }

}
