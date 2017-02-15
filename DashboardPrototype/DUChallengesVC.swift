//
//  DUChallengesVC.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 2/15/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class DUChallengesVC: UIViewController {

    @IBOutlet private weak var circleView: CircleView!
    @IBOutlet private weak var percentageLabel: UILabel!
    @IBOutlet fileprivate weak var likeLabel: UILabel!
    @IBOutlet fileprivate weak var watchingLabel: UILabel!
    @IBOutlet fileprivate weak var membersJoinedLabel: UILabel!
    
    var circleProgressView: CircleView!
    
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        circleProgressView = CircleView(frame: circleView.frame, width: 8, drawColor: UIColor(red: 1, green: 130/255, blue: 0, alpha: 1.0))
        view.addSubview(circleProgressView)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        drawCircleView(percentCompleted: 0.73)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    fileprivate func drawCircleView(percentCompleted percent: CGFloat) {
        
        // Animate the drawing of the circle over the course of 1 second
        circleProgressView.animateCircle(duration: 1.0, toValue: percent)
        percentageLabel.text = "\(Int(percent * 100))" + "% time remaining"
    }
}
