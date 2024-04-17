//
//  SearchViewController.swift
//  Components - Delegates
//
//  Created by Agah Berkin Güler on 1.04.2024.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var users = [User]()
    lazy var filteredUsers = [User]()
    
    var isSearchBarEmpty: Bool {
        searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        searchController.isActive && !isSearchBarEmpty
    }
    
   

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search"
        
        configureSearchController()

        tableView.delegate = self
        tableView.dataSource = self
        
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else { return }
        
        guard let users = try? JSONDecoder().decode([User].self, from: Data(contentsOf: url)) else { return }
        
        self.users = users
        
        
    }
    
    private func filterContextForSearchText(_ searchText: String) {
        filteredUsers = users.filter( { user -> Bool in
            return user.name?.lowercased().contains(searchText.lowercased()) ?? false
        })
        
        tableView.reloadData()
    }
    
    private func configureSearchController() {
        searchController.searchBar.placeholder = "Search User"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredUsers.count
        }
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        if isFiltering {
            cell.textLabel?.text = filteredUsers[indexPath.row].name
        } else {
            cell.textLabel?.text = users[indexPath.row].name
        }
        
        return cell
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContextForSearchText(searchBar.text!)
    }
}
