//
//  ChallengesPageViewController.swift
//  DashboardPrototype
//
//  Created by Dharani Reddy on 14/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class ChallengesPageViewController: UIPageViewController {

    
    weak var challengesDelegate: ChallengesPageDelegate?
    
    var challenges = [ChallengeViewController]()
    
    var direction: Direction = Direction.left
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /**
     Notifies 'categoryPageVC' that the current page index was updated.
     */
    fileprivate func notifyDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = challenges.index(of: firstViewController as! ChallengeViewController) {
            challengesDelegate?.challengesPageViewController(self, didUpdatePageIndex: index, swipeDirection: self.direction)
        }
    }

}

// MARK: ChallengesPageDelegate

protocol ChallengesPageDelegate: class {
    
    /**
     Called when the current index is updated.
     
     - parameter categoryPageViewController: the CategoryPageVC instance
     - parameter index: the index of the currently visible page.
     */
    func challengesPageViewController(_ categoryPageViewController: ChallengesPageViewController,
                                    didUpdatePageIndex index: Int, swipeDirection direction: Direction)
}
