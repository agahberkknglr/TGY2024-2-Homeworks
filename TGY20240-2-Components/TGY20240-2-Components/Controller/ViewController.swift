//
//  ViewController.swift
//  TGY20240-2-Components
//
//  Created by Agah Berkin Güler on 20.03.2024.
//

import UIKit

//TODO: ViewController yasam dongusunu aastiriniz (loadview dahil...)

// MARK: internal, private,fileprivate,public, open

class ViewController: UIViewController {

    @IBOutlet weak var messagaLabel: UILabel!
    @IBOutlet weak var message: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var sliderButton: UISlider!
    @IBOutlet weak var stepperButton: UIStepper!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Merhaba uygulama acildi")
        /*let frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        let label = UILabel(frame: frame)
        
        label.backgroundColor = .red
        label.text = "Merhaba swift ile iOS programlamaya bos geldiniz!"
        //label.textColor = .white
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //label.font = UIFont(name: "Avenir", size: 30)
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        
        view.addSubview(label)*/
        
        //MARK: keyboard hide extension yaziniz
        
        saveButton.setTitle("Save", for:.normal)
        saveButton.setTitleColor(.purple, for: .normal)
        
        switchButton.addTarget(self, action: #selector( switchChangeValue(switchState:)), for: .valueChanged)
        
        stepperButton.maximumValue = 10
        stepperButton.minimumValue = 0
        
        imageView.image = UIImage(systemName: "star")
    }
    
    @objc private func switchChangeValue(switchState: UISwitch){
        if switchState.isOn {
            messagaLabel.text = "Ayarlar aktif edildi"
        }else {
            messagaLabel.text = "Ayarlar pasif edildi"
        }
    }
    
    @IBAction func clickAction(_ sender: Any) {
        
        messagaLabel.text = message.text
        message.text = ""
        
    }
    
    @IBAction func sliderValueAction(_ sender: UISlider) {
        print("Deger: ", sender.value)
    }
    
    
    @IBAction func stepperValueAction(_ sender: UIStepper) {
        messagaLabel.text = String(Int(sender.value))
        
    }
    
    
}

