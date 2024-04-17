//
//  ViewController.swift
//  ToDoApp
//
//  Created by Agah Berkin Güler on 13.04.2024.
//

import UIKit
import CoreData

class ToDoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak private var notesCountLbl: UILabel!
    let searchController = UISearchController(searchResultsController: nil)

    lazy var todos: [Todo] = [] {
        didSet {
            tableView.reloadData()
            notesCountLbl.text = "\(todos.count) \(todos.count == 1 ? "Todo" : "Todos")"
        }
    }
    
    lazy var filteredTodos: [Todo] = [] {
        didSet {
            tableView.reloadData()
            notesCountLbl.text = "\(todos.count) \(todos.count == 1 ? "Todo" : "Todos")"
        }
    }
    
    var isSearchBarEmpty: Bool {
        searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        searchController.isActive && !isSearchBarEmpty
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        configureSearchController()
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
                    
                    //guard let imageData = result.value(forKey: "image") as? Data else { return }
                    //todoImages.append(imageData)
                    //guard let statusData = result.value(forKey: "status") as? Int32 else { return }
                    //todoStatus.append(statusData)
                    //guard let longitudeData = result.value(forKey: "longitude") as? Double else { return }
                    //todoLongitude.append(longitudeData)
                    //guard let latitudeData = result.value(forKey: "latitude") as? Double else { return }
                    //todoLatitude.append(latitudeData)
                    //guard let locationData = result.value(forKey: "location") as? String else { return }
                    //todoLocation.append(locationData)
                }
            } else {
                
            }
        } catch {
            print("Datalar cekilemedi!..")
        }
    }
    
    private func filterTodosForSearchText(_ searchText: String) {
        if searchText.isEmpty {
            // If search text is empty, reload table view with original data
            tableView.reloadData()
        } else {
            // Filter todos based on search text
            filteredTodos = todos.filter { todo -> Bool in
                return todo.name.lowercased().contains(searchText.lowercased())
            }
            tableView.reloadData()
        }
    }
    
    private func configureSearchController() {
        searchController.searchBar.placeholder = "Search"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }

}

extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        
        checkboxButton.addTarget(self, action: #selector(checkboxButtonTapped(_:)), for: .touchUpInside)
        
        cell.accessoryView = checkboxButton
        cell.textLabel?.text = todo.name
        
        return cell
    }
    
    @objc func checkboxButtonTapped(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {

            let todo = todos[indexPath.row]
            
            var newStatus: TodoStatus
            switch todo.status {
            case .undone:
                newStatus = .inprogress
            case .inprogress:
                newStatus = .done
            case .done:
                newStatus = .undone
            }
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Todos")

            do {
                let results = try context.fetch(fetchRequest)
                
                if !results.isEmpty {
                    let todoToUpdate = results[indexPath.row] as! NSManagedObject
                    todoToUpdate.setValue(newStatus.rawValue, forKey: "status")
                    
                    try context.save()
                    
                    todos[indexPath.row].status = newStatus
                    
                    switch newStatus {
                    case .undone:
                        sender.setImage(UIImage(named: "circle"), for: .normal)
                    case .inprogress:
                        sender.setImage(UIImage(named: "hourglass.circle"), for: .normal)
                    case .done:
                        sender.setImage(UIImage(named: "checkmark.circle"), for: .normal)
                    }
                }
                
            } catch {
                print("Error updating todo status: \(error.localizedDescription)")
            }
        }
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                let alertController = UIAlertController(title: "Delete", message: "Do you want to delete this \(todos[indexPath.row].name)", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
                    self.deleteTodo(at: indexPath)
                }
                alertController.addAction(cancelAction)
                alertController.addAction(deleteAction)
                present(alertController, animated: true, completion: nil)
            }
        }
    
    
    private func deleteTodo(at indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Todos")
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if !results.isEmpty {
                let todoToDelete = results[indexPath.row] as! NSManagedObject
                context.delete(todoToDelete)
                
                try context.save()
                
                tableView.beginUpdates()
                todos.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.endUpdates()
            }
            
        } catch {
            print("Silme hatası: \(error.localizedDescription)")
        }
    }
}

extension ToDoListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterTodosForSearchText(searchBar.text!)
    }
}


