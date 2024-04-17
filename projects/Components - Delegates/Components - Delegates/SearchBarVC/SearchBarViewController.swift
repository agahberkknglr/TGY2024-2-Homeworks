//
//  SearchBarViewController.swift
//  Components - Delegates
//
//  Created by Agah Berkin Güler on 1.04.2024.
//

import UIKit

class SearchBarViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]()
    var filteredUsers = [User]()
    var isFiltering: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else { return }
        
        guard let users = try? JSONDecoder().decode([User].self, from: Data(contentsOf: url)) else { return }
        
        self.users = users
        

        // Do any additional setup after loading the view.
    }
}

extension SearchBarViewController: UITableViewDelegate, UITableViewDataSource {
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

extension SearchBarViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isFiltering = true
        
        filteredUsers = users.filter( { user -> Bool in
            return user.name?.lowercased().contains(searchText.lowercased()) ?? false
        })
        
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isFiltering = false
        
        searchBar.text = ""
        
        tableView.reloadData()
    }
}
