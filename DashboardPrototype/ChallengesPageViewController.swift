//
//  ChallengesPageViewController.swift
//  DashboardPrototype
//
//  Created by Dharani Reddy on 14/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class ChallengesPageViewController: UIPageViewController {
    
    let restoreIDs = ["Improve Fitness", "Manage Stress", "Improve Cholesterol", "Improve Blood Pressure"]
    
    weak var challengesDelegate: ChallengesPageDelegate?
    
    var challenges = [ChallengeViewController]()
    
    var direction: Direction = Direction.left
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self
        
        for _ in 0...3 {
            let challenge: ChallengeViewController! = storyboard!.instantiateViewController(withIdentifier: "ChallengeViewController") as! ChallengeViewController
            challenges.append(challenge)
        }
        
        setViewControllers([getViewControllerAtIndex(index: 0)], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        
        // Do any additional setup after loading the view.
    }

    func getViewControllerAtIndex(index: NSInteger) -> ChallengeViewController {
        // Create a new view controller and pass suitable data.
        let challengeViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChallengeViewController") as! ChallengeViewController
        challengeViewController.configure(indexValue: index, identifier: restoreIDs[index])
        return challengeViewController
    }

}

// MARK: ChallengesPageDelegate

protocol ChallengesPageDelegate: class {
    
    /**
     Called when the current index is updated.
     
     - parameter categoryPageViewController: the CategoryPageVC instance
     - parameter index: the index of the currently visible page.
     */
    func challengesPageViewController(updatePageIndex index: Int)
}


// MARK: UIPageViewControllerDataSource

extension ChallengesPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        direction = .right
        
        let challengeViewController = viewController as! ChallengeViewController
        var index = challengeViewController.index
        if ((index == 0) || (index == NSNotFound))
        {
            return nil
        }
        index -= 1
        self.index = index
        return getViewControllerAtIndex(index: index)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        direction = .left
        
        let challengeViewController = viewController as! ChallengeViewController
        var index = challengeViewController.index
        if (index == NSNotFound) {
            return nil
        }
        index += 1
        if (index == 4) {
            return nil
        }
        self.index = index
        return getViewControllerAtIndex(index: index)
    }
}

extension ChallengesPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let identifier = self.viewControllers?.last?.restorationIdentifier {
            if let index = restoreIDs.index(of: identifier) {
                challengesDelegate?.challengesPageViewController(updatePageIndex: index)
            }
        }
    }
}
