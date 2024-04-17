//
//  ViewController.swift
//  Fizy-Clone
//
//  Created by Agah Berkin Güler on 17.04.2024.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .orange
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let myListVC = UINavigationController(rootViewController: MyListsViewController())
        let premiumVC = UINavigationController(rootViewController: PremiumViewController())
        
        homeVC.tabBarItem.image = UIImage(named: "home")
        searchVC.tabBarItem.image = UIImage(named: "search")
        myListVC.tabBarItem.image = UIImage(named: "mylist")
        premiumVC.tabBarItem.image = UIImage(named: "premium")
        
        homeVC.title = "Home"
        searchVC.title = "Search"
        myListVC.title = "My List"
        premiumVC.title = "Premium"
        
        tabBar.tintColor = .white
        tabBar.barTintColor = .black
        
        setViewControllers([homeVC, searchVC, myListVC, premiumVC], animated: true)
        
    }


}

