//
//  CoachViewController.swift
//  DashboardPrototype
//
//  Created by Simanchal Pradhan on 2/14/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class CoachViewController: UIViewController {

    @IBOutlet weak var coachProfileImage: UIImageView!
    @IBOutlet weak var coachSegment: UISegmentedControl!
    @IBOutlet weak var segmentDescription: UITextView!
    
    let coachSegmentDescriptionList = ["Diabetes & Blood Sugar Control\nHeart health\nStress Reduction\nDiet\nPhysical Activity", "I have over 20 years of experience in health education, fitness instruction and wellness coaching for corporate and individual clients.  Working with people to help them achieve a healthy and balanced life is truly my passion!\n\nMy goal is to educate, support and empower everyone I work with! I will provide all the motivation and information you need to create a wellness plan that works for your lifestyle.", "NSHC – National Society of Health Coaches\nAmerican Council on Exercise (ACE)\nDr. Sears Wellness Institute\nDuke Integrative Medicine\nWellcoaches School of Coaching"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Coach"
        circulerImage()
        setSegmentDescription()
        segmentDescription.isEditable = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func circulerImage() {
        coachProfileImage.layer.cornerRadius = coachProfileImage.frame.size.width/2
        coachProfileImage.clipsToBounds = true
    }
    @IBAction func changeCoachSegment(_ sender: Any) {
        setSegmentDescription()
    }
    
    fileprivate func setSegmentDescription(){
        self.segmentDescription.alpha = 0
        segmentDescription.text = coachSegmentDescriptionList[coachSegment.selectedSegmentIndex]
        UIView.animate(withDuration: 1.0, animations: { () -> Void in
            self.segmentDescription.alpha = 1.0
        })
    }
    
}
