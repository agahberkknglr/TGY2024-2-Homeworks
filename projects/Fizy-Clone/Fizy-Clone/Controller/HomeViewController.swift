//
//  HomeViewController.swift
//  Fizy-Clone
//
//  Created by Agah Berkin Güler on 17.04.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["Today's Picks","Podcast", "Akustikhane","Weekly Mixes", "Non-Stop Radio"]
    
    private let homeTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifer)
        return table
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome Agah"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
        

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        view.addSubview(homeTable)
        
        homeTable.dataSource = self
        homeTable.delegate = self
        
        homeTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 80))
        
        
        configureNavigationBar()
        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTable.frame = view.bounds
    }
    
    private func configureNavigationBar(){
        
       // self.navigationItem.titleView = self.titleLabel
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.titleLabel)
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: nil)
        
        let giftImage = UIImage(named: "gift")?.withRenderingMode(.alwaysOriginal)
        let settingImage = UIImage(named: "settings")?.withRenderingMode(.alwaysOriginal)
        let faceImage = UIImage(named: "face")?.withRenderingMode(.alwaysOriginal)
        
        
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: faceImage, style: .done, target: self, action: nil),
            UIBarButtonItem(image: settingImage, style:.done, target: self, action: nil),
            UIBarButtonItem(image: giftImage, style:.done, target: self, action: nil)
        ]

    }

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifer, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        //var cell: UITableViewCell
        
        /*if indexPath.row == 0 {
            guard let storCell = tableView.dequeueReusableCell(withIdentifier: StoryViewController.identifierStory, for: indexPath) as? StoryViewController else {
                return UITableViewCell()
            }
            cell = storCell
        } else {
            guard let collectionViewCell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifer, for: indexPath) as? CollectionViewTableViewCell else {
                return UITableViewCell()
            }
            cell = collectionViewCell
        }*/
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.lowercased().capitalized
    }
    
}
