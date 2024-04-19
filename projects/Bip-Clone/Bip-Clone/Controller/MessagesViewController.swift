//
//  ViewController.swift
//  Bip-Clone
//
//  Created by Agah Berkin Güler on 18.04.2024.
//

import UIKit

class MessagesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var myMessages = [Message]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        myMessages.append(Message(image: "turkcell", title: "GYGY 3.0 - Swift(2)", time: "13.37", info: "Kerim Caglar: Herkese iyi bayramlar diliyorum"))
        myMessages.append(Message(image: "user", title: "Baris", time: "12.15", info: "Hello, I joined BiP too!"))
        myMessages.append(Message(image: "user", title: "Berkay", time: "Sunday", info: "Hello, I joined BiP too!"))
        
        tableView.register(UINib(nibName: "MessagesTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }


}

extension MessagesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MessagesTableViewCell
        
        cell.setupMessageCell(model: myMessages[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMessages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

