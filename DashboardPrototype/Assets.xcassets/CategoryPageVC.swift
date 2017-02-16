//
//  CategoryPageVC.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 2/13/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

var data:Dictionary<String,String> = ["one":"challenge", "two":"two", "three":"three"]

class CategoryPageVC: UIPageViewController {

    var pages = [UIViewController]()
    
    var direction: Direction = Direction.left
    
    weak var categoryPageVCDelegate: CategoryPageVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        data.forEach { (key, value) in
            let page: UIViewController! = storyboard?.instantiateViewController(withIdentifier: key)
            pages.append(page)
        }
        
        setViewControllers([pages.first!], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        
//        categoryPageVCDelegate?.categoryPageViewController(self, didUpdatePageIndex: pages.count)
    }
    
    /**
     Notifies 'categoryPageVC' that the current page index was updated.
     */
    fileprivate func notifyDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = pages.index(of: firstViewController) {
            categoryPageVCDelegate?.categoryPageViewController(self,
                                                               didUpdatePageIndex: index, swipeDirection: self.direction)
        }
    }
}

// MARK: UIPageViewControllerDataSource

extension CategoryPageVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        self.direction = .right
        
        guard let viewControllerIndex = pages.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return pages.last
        }
        
        guard pages.count > previousIndex else {
            return nil
        }
        
        return pages[previousIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        self.direction = .left
        
        guard let viewControllerIndex = pages.index(of: viewController) else {
            return nil
        }
    
        let nextIndex = viewControllerIndex + 1
        let count = pages.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard count != nextIndex else {
            return pages.first
        }
        
        guard count > nextIndex else {
            return nil
        }
        
        return pages[nextIndex]
    }
}

extension CategoryPageVC: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        print(previousViewControllers.count)
    
        let firstViewController = viewControllers?.first
        let index = pages.index(of: firstViewController!)!
        let previousViewController = previousViewControllers.first
        let previousIndex = pages.index(of: previousViewController!)!
        
        if index == pages.count - 1 && previousIndex == 0 {
            self.direction = .right
        } else if index > previousIndex {
            self.direction = .left
        } else if index == 0 && previousIndex == pages.count - 1 {
            self.direction = .left
        } else {
            self.direction = .right
        }
        
        if completed {
            notifyDelegateOfNewIndex()
        }
    }
    
}

// MARK: CategoryPageVCDelegate

protocol CategoryPageVCDelegate: class {
    
    /**
     Called when the current index is updated.
     
     - parameter categoryPageViewController: the CategoryPageVC instance
     - parameter index: the index of the currently visible page.
     */
    func categoryPageViewController(_ categoryPageViewController: CategoryPageVC,
                                    didUpdatePageIndex index: Int, swipeDirection direction: Direction)
}
