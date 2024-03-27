//
//  SenderViewController.swift
//  Components - Delegates
//
//  Created by Agah Berkin Güler on 27.03.2024.
//

import UIKit

protocol MessageDelegate: AnyObject{
    func sendMessage(text: String)
}

class SenderViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    
    
    weak var delegate: MessageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("uygukama sona erdi 2")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("uygulama sona erdi 3")
    }
    
    @IBAction func sendDataAction(_ sender: UIButton) {
        
        guard let text = messageTextField.text else { return }
        delegate?.sendMessage(text: text)
        dismiss(animated: true)
    }
    
    deinit {
        print("uygulama sona erdi")
    }
    
}
