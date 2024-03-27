//
//  ViewController.swift
//  TGY24-2-components
//
//  Created by Agah Berkin Güler on 25.03.2024.
//

import UIKit

//TODO: ViewController yasam dongulerini arastiriniz laodview dahil...

//MARK: internal, private, fileprivate, public, open (mulakat sorulari)..

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stepperButton: UIStepper!
    @IBOutlet weak var sliderButton: UISlider!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Merhaba uygulama acildi")
        
        /*
        let frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        let label = UILabel(frame: frame)
        label.backgroundColor = .red
        label.text = "Merhaba swift ile ios proglamlamaya hosgeldiniz"
        //label.textColor = .white
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //label.font = UIFont(name: "Avenir", size: 30)
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        
        view.addSubview(label)
        */
        
        // MARK: Keyboard hide extension yaziniz
        hideKeyboardWhenTapped()
        
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.purple, for: .normal)
        
        
        switchButton.addTarget(self, action: #selector(switchChangeValue), for: .valueChanged)
        
        stepperButton.maximumValue = 10
        stepperButton.minimumValue = 0
        
        imageView.image = UIImage(systemName: "moon")
    }
    
    @objc private func switchChangeValue(switchState:UISwitch) {
        if switchState.isOn {
            messageLabel.text = "Ayarlar aktif edildi"
        }else {
            messageLabel.text = "Ayalar pasif edildi"
        }
    }

    @IBAction func clickAction(_ sender: Any) {
        messageLabel.text = messageTextField.text
        messageTextField.text = ""
    }
    
    @IBAction func sliderValueAction(_ sender: UISlider) {
        print("Deger: ", sender.value)
    }
    
    @IBAction func stepperValueAction(_ sender: UIStepper) {
        messageLabel.text = String(Int(sender.value))
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

