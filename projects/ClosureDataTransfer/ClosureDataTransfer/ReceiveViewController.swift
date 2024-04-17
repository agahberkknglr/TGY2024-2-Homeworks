//
//  ReceiveViewController.swift
//  ClosureDataTransfer
//
//  Created by Agah Berkin Güler on 27.03.2024.
//

import UIKit

class ReceiveViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let sendVC = SendViewController()
        let receiveVC = ReceiveViewController()

        sendVC.messageClosure = { message in
            receiveVC.reveiveMessage(message: message)
        }

        let navigationController = UINavigationController(rootViewController: sendVC)
        navigationController.present(receiveVC, animated: true, completion: nil)
    }
    

    @IBAction func goBackAction(_ sender: UIButton) {
    }
    
    func reveiveMessage(message: String?) {
        if let receivedMessage = message {
            textLabel.text = receivedMessage
        } else {
            textLabel.text = "Error"
        }
    }
    

}
