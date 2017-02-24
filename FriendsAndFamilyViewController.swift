//
//  FriendsAndFamilyViewController.swift
//  DashboardPrototype
//
//  Created by Simanchal Pradhan on 2/22/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class FriendsAndFamilyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var percentageBar: UIView!
    
    let names = ["Michael Jackob", "Sarah William", "Robert William", "Jasmine Isaac", "William White"]
    let images = ["michael", "sarah", "robert", "jasmine", "cameron"]
    let relations = ["Friend", "Sister", "Brother", "Mother", "Father"]
    let status = ["active", "inactive"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = "Friends & Family"
        UIView.transition(with: percentageBar, duration: 1.0, options: .transitionFlipFromLeft, animations: {self.percentageBar.frame = CGRect(x: 0, y: 0, width: (self.names.count*200/10), height: 15)}, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsAndFamilyTableViewCell", for: indexPath) as? FriendsAndFamilyTableViewCell
        cell?.userName.text = names[indexPath.row]
        cell?.userImage.image = UIImage(named: images[indexPath.row])
        cell?.userRelation.text = "(\(relations[indexPath.row]))"
        cell?.userStatus.image = UIImage(named: status[indexPath.row % 2])
        cell?.animate(revert: true)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }

}
