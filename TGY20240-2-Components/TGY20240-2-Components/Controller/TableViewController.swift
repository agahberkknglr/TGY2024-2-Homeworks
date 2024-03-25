//
//  TableViewController.swift
//  TGY20240-2-Components
//
//  Created by Agah Berkin Güler on 22.03.2024.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cities = ["Aydin", "Samsun", "Burdur", "Mugla", "Mersin"]
    var famous = ["Incir", "Pide", "Ceviz Ezmesi", "Keskek", "Tantuni"]
    var images = ["incir", "pide", "ceviz-ezmesi", "keskek", "tantuni"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension TableViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row]
        cell.detailTextLabel?.text = famous[indexPath.row]
        cell.imageView?.image = UIImage(named:  images[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let message = ("\(cities[indexPath.row]) sehrinin en meshur yiyecegi \(famous[indexPath.row])'dir.")
        
        let alertController = UIAlertController(title: cities[indexPath.row], message: famous[indexPath.row], preferredStyle: .alert)
        let action UIAlertAction(title:"OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
