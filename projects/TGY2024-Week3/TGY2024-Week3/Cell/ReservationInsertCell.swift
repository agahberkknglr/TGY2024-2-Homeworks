//
//  ReservationInsertCell.swift
//  TGY2024-Week3
//
//  Created by Agah Berkin Güler on 1.04.2024.
//

import UIKit

protocol ReservationInsertCellDelegate: AnyObject {
    func reloadData()
}

class ReservationInsertCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView! {
        didSet{
            cardView.layer.borderWidth = 1
            cardView.layer.borderColor = UIColor(red: 0.09, green: 0.81, blue: 0.77, alpha: 1).cgColor
            cardView.layer.cornerRadius = 6
        }
    }
    
    @IBOutlet weak var reservationHeaderStackView: UIStackView!
    @IBOutlet weak var reservationNumberStackView: UIStackView!
    @IBOutlet weak var reservationVerifyStackView: UIStackView!
    
    @IBOutlet weak var reservationListExpandLabel: UILabel!
    @IBOutlet weak var reservatinNumberTextField: UITextField!
    
    @IBOutlet weak var digit1: UITextField!
    @IBOutlet weak var digit2: UITextField!
    @IBOutlet weak var digit3: UITextField!
    @IBOutlet weak var digit4: UITextField!
    @IBOutlet weak var digit5: UITextField!
    @IBOutlet weak var digit6: UITextField!
    
    weak var delegate: ReservationInsertCellDelegate?
    
    private func configure() {
        reservationListExpandLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(expand))
        reservationListExpandLabel.addGestureRecognizer(tap )
    }
    
    @objc private func expand() {
        reservationNumberStackView.isHidden = !reservationNumberStackView.isHidden
        reservationVerifyStackView.isHidden = true
        if reservationNumberStackView.isHidden {
            reservationListExpandLabel.text = "+ Rezervasyonumu Listeme Ekle"
        } else {
            reservationListExpandLabel.text = "- Rezervasyonumu Listeme Ekle"
        }
        
        delegate?.reloadData()
        
    }
    
    private func configureReservationNumber() {
        let rightStackView = UIStackView()
        rightStackView.axis = .horizontal
        let emptyView = UIView()
        emptyView.backgroundColor = .clear
        emptyView.widthAnchor.constraint(equalToConstant: 4).isActive = true
        let button = UIButton(type: .custom)
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 46).isActive = true
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.setTitle("Sorgula", for: .normal)
        button.addTarget(self, action: #selector(getVerifyCode), for: .touchUpInside)
        
        rightStackView.addArrangedSubview(button)
        rightStackView.addArrangedSubview(emptyView)
        reservatinNumberTextField.rightViewMode = .always
        reservatinNumberTextField.rightView = rightStackView
    }
     
    @objc private func getVerifyCode() {
        reservationVerifyStackView.isHidden = false
        delegate?.reloadData()
        digit1.becomeFirstResponder()
    }
    
    private func configureOTP() {
        digit1.delegate = self
        digit2.delegate = self
        digit3.delegate = self
        digit4.delegate = self
        digit5.delegate = self
        digit6.delegate = self
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configure()
        configureReservationNumber()
        configureOTP()
    }

    
    
}

extension ReservationInsertCell: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let text = textField.text
        
        if text?.utf8.count == 1 {
            switch textField {
            case digit1:
                digit2.becomeFirstResponder()
            case digit2:
                digit3.becomeFirstResponder()
            case digit3:
                digit4.becomeFirstResponder()
            case digit4:
                digit5.becomeFirstResponder()
            case digit5:
                digit6.becomeFirstResponder()
            case digit6:
                digit6.resignFirstResponder()
            default:
                break
            }
        }
    }
}

//key value observing *kvo didset - willset aciklamalarini okuyunuz
