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
    @IBOutlet private weak var percentageLabel: UILabel!
    @IBOutlet fileprivate weak var pageControl: UIPageControl!
    @IBOutlet fileprivate weak var likeLabel: UILabel!
    @IBOutlet fileprivate weak var watchingLabel: UILabel!
    @IBOutlet fileprivate weak var membersJoinedLabel: UILabel!
    
    var circleProgressView: CircleView!
    
    var challengesPageVC: ChallengesPageViewController? {
        didSet {
            challengesPageVC?.challengesDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        pageControl.currentPage = 0
        pageControl.numberOfPages = 4
        
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
    func challengesPageViewController(updatePageIndex index: Int) {
        pageControl.currentPage = index
        likeLabel.text = ["6", "19", "7", "21"][index]
        watchingLabel.text = ["103", "8", "69", "99"][index]
        membersJoinedLabel.text = ["57", "143", "157", "29"][index]
        drawCircleView(percentCompleted: [0.73, 0.58, 0.96, 0.99][index])
    }
}
