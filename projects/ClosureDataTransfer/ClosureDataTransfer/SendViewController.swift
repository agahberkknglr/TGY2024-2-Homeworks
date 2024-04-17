//
//  SendViewController.swift
//  ClosureDataTransfer
//
//  Created by Agah Berkin Güler on 27.03.2024.
//

import UIKit

class SendViewController: UIViewController {
    
    var messageClosure: ((String?) -> Void)?

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendAction(_ sender: UIButton) {
        let text = textField.text
        messageClosure?(text)
        dismiss(animated: true,completion: nil)
        
    }
    
}

