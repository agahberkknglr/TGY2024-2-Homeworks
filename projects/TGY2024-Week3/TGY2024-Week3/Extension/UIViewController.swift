//
//  UIViewController.swift
//  TGY2024-Week3
//
//  Created by Agah Berkin Güler on 1.04.2024.
//

import Foundation
import UIKit

extension UIViewController {
    
    func hideKeyboardTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action:
                                            #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view?.endEditing(true)
    }
}
