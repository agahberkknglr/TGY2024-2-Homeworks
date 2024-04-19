//
//  MoreViewController.swift
//  Bip-Clone
//
//  Created by Agah Berkin Güler on 19.04.2024.
//

import UIKit

class MoreViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var myMore = [More]()
    var myUser = [Message]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        self.title = "More"
        
        myMore.append(More(icon: "games", title: "Games"))
        myMore.append(More(icon: "channels", title: "Channels"))
        myMore.append(More(icon: "paycell", title: "Paycell"))
        myMore.append(More(icon: "contactList", title: "Contact List"))
        myMore.append(More(icon: "dialPad", title: "Dial Pad"))
        myMore.append(More(icon: "camera", title: "Camera"))
        myMore.append(More(icon: "emergency2", title: "Emergency"))
        myMore.append(More(icon: "starredMessage", title: "Starred Message"))
        myMore.append(More(icon: "bipweb", title: "BiP Web"))
        myMore.append(More(icon: "invite", title: "Invite"))
        myMore.append(More(icon: "settings", title: "Settings"))
        
        myUser.append(Message(image: "user2", title: "Agah Berkin Guler", time: "", info: "What's in your mind?"))
        
        
        
        
        
        
        tableView.register(UINib(nibName: "MessagesTableViewCell", bundle: nil), forCellReuseIdentifier: "userCell")
        tableView.register(UINib(nibName: "MoreTableViewCell", bundle: nil), forCellReuseIdentifier: "moreCell")

    }
    

    

}
extension MoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMore.count + myUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! MessagesTableViewCell
            cell.setupMessageCell(model: myUser[indexPath.row])
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "moreCell", for: indexPath) as! MoreTableViewCell
            cell.setupMoreCell(model: myMore[indexPath.row - 1])
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        }
        return 50
    }
    
    
}
