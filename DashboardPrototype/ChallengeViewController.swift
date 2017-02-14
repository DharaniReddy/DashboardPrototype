//
//  ChallengeViewController.swift
//  DashboardPrototype
//
//  Created by Dharani Reddy on 14/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class ChallengeViewController: UIViewController {

    var index = 0
    
    // MARK:- IBOutlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var challengeImageView: UIImageView!
    
    func configure(indexValue: Int, identifier: String) {
        index = indexValue
        restorationIdentifier = identifier
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = ["Improve Fitness", "Manage Stress", "Improve Cholesterol", "Improve Blood Pressure"][index]
        challengeImageView.image = UIImage(named: ["challenge", "manage_stress", "snapshotReport", "blood_pressure"][index])
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
