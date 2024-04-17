//
//  ViewController.swift
//  TGY2024-Week3
//
//  Created by Agah Berkin Güler on 1.04.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "ReservationInsertCell", bundle: nil), forCellReuseIdentifier: "reservationInsertCell")
        hideKeyboardTappedAround()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reservationInsertCell") as! ReservationInsertCell
        
        cell.delegate = self
        
        return cell
    }
}

extension ViewController: ReservationInsertCellDelegate {
    func reloadData() {
        tableView.reloadData()
    }
}
