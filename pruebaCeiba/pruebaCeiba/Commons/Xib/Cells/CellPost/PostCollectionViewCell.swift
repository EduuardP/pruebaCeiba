//
//  PostCollectionViewCell.swift
//  pruebaCeiba
//
//  Created by IMac on 02/11/20.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblUserId: UILabel!
    @IBOutlet weak var lblId: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(post:Post) {
        initCell()
        lblTitle.text = post.title
        lblId.text = "\(post.id)"
        lblUserId.text = "\(post.userId)"
        
    }
    
    func initCell() {
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = 5
        contentView.layer.borderWidth = 1
    }

}
