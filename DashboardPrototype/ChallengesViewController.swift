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
    
    var circleProgressView: CircleView!
    
    var challengesPageVC: ChallengesPageViewController? {
        didSet {
            challengesPageVC?.challengesDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
        circleProgressView = CircleView(frame: circleView.frame, width: 8, drawColor: UIColor(red: 1, green: 130/255, blue: 0, alpha: 1.0))
        view.addSubview(circleProgressView)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        
        // Animate the drawing of the circle over the course of 1 second
        circleProgressView.animateCircle(duration: 1.0, toValue: 0.73)
        percentageLabel.text = "\(Int(0.73 * 100))" + "% time remaining"
    }
    
    @IBAction private func popViewController() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    // MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let challengesPageVC = segue.destination as? ChallengesPageViewController {
            self.challengesPageVC = challengesPageVC
        }
    }
}

extension ChallengesViewController: ChallengesPageDelegate {
    func challengesPageViewController(_ categoryPageViewController: ChallengesPageViewController, didUpdatePageIndex index: Int, swipeDirection direction: Direction) {
        
    }
}
