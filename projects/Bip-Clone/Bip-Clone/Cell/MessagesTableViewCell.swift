//
//  MessagesTableViewCell.swift
//  Bip-Clone
//
//  Created by Agah Berkin Güler on 18.04.2024.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var messageTitle: UILabel!
    @IBOutlet weak var messageInfo: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCircularImageView()
        setupCellAppearance()
    }
    
    func setupMessageCell(model: Message){
        messageImage.image = UIImage(named: model.image ?? "")
        messageTitle.text = model.title ?? ""
        
        if let time = model.time, !time.isEmpty {
            timeLabel.isHidden = false
            timeLabel.text = time
        } else {
            timeLabel.isHidden = true
        }
            
        if let info = model.info, !info.isEmpty {
            messageInfo.isHidden = false
            messageInfo.text = info
        } else {
            messageInfo.isHidden = true
        }
    }
    
    private func setupCircularImageView() {
        messageImage.layer.cornerRadius = messageImage.frame.size.width / 2
        messageImage.clipsToBounds = true
     }
    private func setupCellAppearance() {
        self.selectionStyle = .none
    }
    
}
