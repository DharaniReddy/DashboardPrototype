//
//  ChallengesViewController.swift
//  DashboardPrototype
//
//  Created by Dharani Reddy on 13/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class ChallengesViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet private weak var circleView: CircleView!
    @IBOutlet private weak var percentageLabel: UILabel!
    @IBOutlet fileprivate weak var pageControl: UIPageControl!
    @IBOutlet fileprivate weak var likeLabel: UILabel!
    @IBOutlet fileprivate weak var watchingLabel: UILabel!
    @IBOutlet fileprivate weak var membersJoinedLabel: UILabel!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var scrollableView: UIView!
    @IBOutlet private weak var containerView: UIImageView!
    
    var circleProgressView: CircleView!
    
    var selectedIndex: Int = 0
    
    var challengesPageVC: ChallengesPageViewController? {
        didSet {
            challengesPageVC?.challengesDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        pageControl.numberOfPages = 4
        pageControl.currentPage = selectedIndex
        
        circleProgressView = CircleView(frame: circleView.frame, width: 8, drawColor: UIColor(red: 1, green: 130/255, blue: 0, alpha: 1.0))
        scrollableView.addSubview(circleProgressView)
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let containerHeight = containerView.frame.height
        
        let newOrigin = CGPoint(x: 0, y: -containerHeight)
        
        scrollView.contentOffset = newOrigin
        scrollView.contentInset = UIEdgeInsets(top: containerHeight, left: 0, bottom: 0, right: 0)
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
            challengesPageVC.index = selectedIndex
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        
        if offsetY < 0 {
            containerView.frame.size.height = -offsetY
        } else {
            containerView.frame.size.height = containerView.frame.height
        }
    }
}

extension ChallengesViewController: ChallengesPageDelegate {
    func challengesPageViewController(updatePageIndex index: Int) {
        guard selectedIndex != index else {
            return
        }
        selectedIndex = index
        pageControl.currentPage = index
        likeLabel.text = ["6", "19", "7", "21"][index]
        watchingLabel.text = ["103", "8", "69", "99"][index]
        membersJoinedLabel.text = ["57", "143", "157", "29"][index]
        drawCircleView(percentCompleted: [0.73, 0.58, 0.96, 0.99][index])
    }
}
