//
//  MyCoachViewController.swift
//  DashboardPrototype
//
//  Created by Dharani Reddy on 28/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class MyCoachViewController: UIViewController {
    
    @IBOutlet private weak var specialitiesLabel: UILabel!
    @IBOutlet private weak var bioLabel: UILabel!
    @IBOutlet private weak var certificationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        specialitiesLabel.text = "Diabetes and Blood Sugar Control\nHeart Heath\nStress Reduction\nDiet\nPhysical Activity"
        bioLabel.text = "I have over 20 years of experience in health education, fitness instruction and wellness coaching for corporate and individual clients.  Working with people to help them achieve a healthy and balanced life is truly my passion!\n\nMy goal is to educate, support and empower everyone I work with! I will provide all the motivation and information you need to create a wellness plan."
        certificationLabel.text = "NSHC – National Society of Health Coaches\nAmerican Council on Exercise (ACE)\nDr. Sears Wellness Institute\nDuke Integrative Medicine\nWellcoaches School of Coaching"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissOnSwipe(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
