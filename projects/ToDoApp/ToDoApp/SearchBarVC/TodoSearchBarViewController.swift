//
//  TodoSearchBarViewController.swift
//  ToDoApp
//
//  Created by Agah Berkin Güler on 17.04.2024.
//

import UIKit
import CoreData

class TodoSearchBarViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var todos: [Todo] = [] {
        didSet {
            tableView.reloadData()
            //notesCountLbl.text = "\(todos.count) \(todos.count == 1 ? "Todo" : "Todos")"
        }
    }
    var filteredTodos: [Todo] = [] {
        didSet {
            tableView.reloadData()
            //notesCountLbl.text = "\(todos.count) \(todos.count == 1 ? "Todo" : "Todos")"
        }
    }
    var isFiltering: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getTodos()
    }
    
    private func getTodos() {
        todos.removeAll()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Todos")
        do {
            let results = try context.fetch(fetchRequest)
            
            if !results.isEmpty {
                for result in results as! [NSManagedObject] {
                    guard let name = result.value(forKey: "name") as? String else { return }
                    guard let statusValue = result.value(forKey: "status") as? Int else { return }
                    guard let status = TodoStatus(rawValue: statusValue) else { return }
                    let todo = Todo(name: name, status: status)
                    todos.append(todo)
                    
                }
            } else {
                
            }
        } catch {
            print("Datalar cekilemedi!..")
        }
    }
    

}

extension TodoSearchBarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredTodos.count
        }
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        let todo = todos[indexPath.row]
        
        let checkboxButton = UIButton(type: .custom)
        checkboxButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        switch todo.status {
            case .undone:
                checkboxButton.setImage(UIImage(named: "circle"), for: .normal)
            case .inprogress:
                checkboxButton.setImage(UIImage(named: "hourglass.circle"), for: .normal)
            case .done:
                checkboxButton.setImage(UIImage(named: "checkmark.circle"), for: .normal)
            }
        
        //checkboxButton.addTarget(self, action: #selector(checkboxButtonTapped(_:)), for: .touchUpInside)
        
        //cell.accessoryView = checkboxButton
        cell.textLabel?.text = todo.name
        
        return cell
    }
}

extension TodoSearchBarViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isFiltering = false
            filteredTodos = []
        } else {
            isFiltering = true
            filteredTodos = todos.filter { todo -> Bool in
                return todo.name.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isFiltering = false
        
        searchBar.text = ""
        
        tableView.reloadData()
    }
}
