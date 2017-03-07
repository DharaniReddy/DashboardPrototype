//
//  CardDetailViewViewController.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/6/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var stateController: StateController!
    
    @IBOutlet weak var cardTitle: UILabel?
    @IBOutlet weak var cardType: UILabel?
    
}

class ChallengeDetailViewViewController: BaseViewController {
    
    var card: EngagementCardProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewCard = card {
            cardTitle?.text = viewCard.cardTitle
            cardType?.text = viewCard.cardType
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
