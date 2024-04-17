//
//  TabbarViewController.swift
//  Week-4
//
//  Created by Agah Berkin Güler on 5.04.2024.
//

import UIKit

class TabbarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabbarconfig()
    }
    
    
    private func tabbarconfig(){
        guard let tabbar = tabBarController?.tabBar else { return }
        
        tabbar.backgroundColor = .orange
        tabbar.tintColor = .black
        tabbar.unselectedItemTintColor = .white
        
        tabbar.layer.cornerRadius = 30
        tabbar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        tabbar.layer.borderWidth = 2
        tabbar.layer.borderColor = UIColor.black.cgColor
    }

   

}
