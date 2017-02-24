//
//  FriendsAndFamilyTableViewCell.swift
//  DashboardPrototype
//
//  Created by Simanchal Pradhan on 2/22/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class FriendsAndFamilyTableViewCell: UITableViewCell {

    @IBOutlet weak var userRelation: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userStatus: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func animate( revert: Bool = false) {
        UIView.animate(withDuration: 1.0, animations: {
            self.layoutIfNeeded()
        })
    }
}
