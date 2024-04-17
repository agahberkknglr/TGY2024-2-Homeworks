//
//  listenerViewController.swift
//  Components - Delegates
//
//  Created by Agah Berkin Güler on 27.03.2024.
//

import UIKit

class ListenerViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getDataAction(_ sender: UIButton) {
        let senderVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SenderViewController") as! SenderViewController
        
        senderVC.delegate = self
        
        present(senderVC, animated: true)
    }
    
}

extension ListenerViewController: MessageDelegate {
    func sendMessage(text: String) {
        messageLabel.text = text
    }
}

