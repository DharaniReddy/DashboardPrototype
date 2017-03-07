//
//  CardDetailViewViewController.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/6/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class CardDetailViewViewController: UIViewController {

    @IBOutlet weak var cardTitle: UILabel?
    @IBOutlet weak var cardType: UILabel?
    
    var card: EngagementCard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewCard = card {
            cardTitle?.text = viewCard.cardTitle
            cardType?.text = viewCard.cardType
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
