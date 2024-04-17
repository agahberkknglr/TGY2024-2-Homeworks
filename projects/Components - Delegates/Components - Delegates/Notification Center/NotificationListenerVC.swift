//
//  NotificationListenerVC.swift
//  Components - Delegates
//
//  Created by Agah Berkin Güler on 27.03.2024.
//

import UIKit

class NotificationListenerVC: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var images: [String] = ["a","b","c","d","e"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationSender: NotificationCenter = .default
        notificationSender.addObserver(self, selector: #selector(changeImage), name: .sendDataNotification, object: nil)
        notificationSender.addObserver(self, selector: #selector(changeLabel(_:)), name: .sendTextFieldNotification, object: nil)
        
    }
    @objc func changeImage() {
        imageView.image = UIImage(named: images.randomElement() ?? "a")
    }
    
    @objc func changeLabel(_ notification: Notification) {
           
           if let userInfo = notification.userInfo,
              let text = userInfo["text"] as? String {
               messageLabel.text = text
           }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    


}
