//
//  SearchViewController.swift
//  Fizy-Clone
//
//  Created by Agah Berkin Güler on 17.04.2024.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    let searchBar = UISearchBar()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        searchBar.delegate = self
        searchBar.placeholder = "Songs, artist, podcasts..."
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
                searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
 

    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            // Implement search functionality here
            if let searchText = searchBar.text {
                print("Searching for: \(searchText)")
                // Perform search operations with searchText
            }
            
            searchBar.resignFirstResponder() // Dismiss keyboard
        }
}


