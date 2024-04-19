//
//  MoreTableViewCell.swift
//  Bip-Clone
//
//  Created by Agah Berkin Güler on 19.04.2024.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

    @IBOutlet weak var moreImageView: UIImageView!
    @IBOutlet weak var moreTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCellAppearance()
    }
    
    func setupMoreCell(model:More){
        moreImageView.image = UIImage(named: model.icon ?? "")
        moreTitle.text = model.title
    }
    private func setupCellAppearance() {
        self.selectionStyle = .none
    }
    

    
    
}
