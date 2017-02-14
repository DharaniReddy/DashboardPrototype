//
//  CardView.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 2/10/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class CardView: UIView {

    @IBOutlet weak var backgroundImage: UIImageView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
//        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }

}
