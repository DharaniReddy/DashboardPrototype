//
//  PlanCell.swift
//  DashboardPrototype
//
//  Created by Simanchal Pradhan on 2/15/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class PlanCell: UITableViewCell {
    @IBOutlet weak var planTitle: UILabel!
    @IBOutlet weak var planDescription: UILabel!
    @IBOutlet weak var tickMarkView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
