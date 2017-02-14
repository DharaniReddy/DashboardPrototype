//
//  RoundedButton.swift
//  DashboardPrototype
//
//  Created by Dharani Reddy on 13/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation

class RoundedWhiteBorderButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 13.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.init(white: 1.0, alpha: 0.7).cgColor
    }
}
