//
//  NotificationSenderVC.swift
//  Components - Delegates
//
//  Created by Agah Berkin Güler on 27.03.2024.
//

import UIKit

class NotificationSenderVC: UIViewController {
    
    
    @IBOutlet weak var senderTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendNotificationAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: .sendDataNotification, object: nil)
        if let text = senderTextField.text {
            NotificationCenter.default.post(name: .sendTextFieldNotification, object: nil, userInfo: ["text": text])
        }
        dismiss(animated: true)
    }
    
    
    
}


