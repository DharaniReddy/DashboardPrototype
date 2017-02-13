//
//  ChallengesViewController.swift
//  DashboardPrototype
//
//  Created by Dharani Reddy on 13/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class ChallengesViewController: UIViewController {

    @IBOutlet private weak var circleView: CircleView!
    @IBOutlet weak var percentageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addCircleView()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func addCircleView() {
        
        // Create a new CircleView
        let circleView = CircleView(frame: self.circleView.frame)
        
        view.addSubview(circleView)
        
        // Animate the drawing of the circle over the course of 1 second
        circleView.animateCircle(duration: 1.0, toValue: 0.8)
        percentageLabel.text = "\(Int(0.8 * 100)) " + "% completed"
    }
    
    @IBAction private func popViewController() {
        _ = navigationController?.popViewController(animated: true)
    }
}
