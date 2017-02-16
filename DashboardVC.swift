//
//  DashboardVC.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 2/13/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

enum Direction {
    case right
    case left
}

enum Things: String, CustomStringConvertible {
    var description: String {
        return rawValue
    }
    
    case one = "challengeLayout2"
    case two = "coachLayout2"
    case three = "goalsLayout2"
    
}

class DashboardVC: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    weak var currentViewController: UIViewController?
    var currentIndex: Int = 0
    
    var categoryPageVC: CategoryPageVC? {
        didSet {
            categoryPageVC?.categoryPageVCDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let VC = getCurrentVC("challengeLayout2")
        self.addChildViewController(VC)
        self.addSubview(subView: VC.view, toView: self.contentView)
    }
    
    func getCurrentVC(_ id: String) -> UIViewController {
        self.currentViewController = self.storyboard?.instantiateViewController(withIdentifier: id)
        self.currentViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        return self.currentViewController!
    }

    func addSubview(subView:UIView, toView parentView:UIView) {
        
        parentView.addSubview(subView)
        
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                                 options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                                 options: [], metrics: nil, views: viewBindingsDict))
    }
    
    func removeOldViews(_ parentView: UIView) -> Void {
        if parentView.subviews.count > 1 {
            parentView.subviews.forEach({ (view) in
                if parentView.subviews.last == view { return }
                view.removeFromSuperview()
            })
        }
    }
    
    func getViewId(_ index: Int) -> String {
        let id:String
        
        switch index {
        case 0:
            id = Things.one.rawValue
        case 1:
            id = Things.two.rawValue
        default:
            id = Things.three.rawValue
        }
        
        return id
    }
    
    func animateViews(_ index: Int, _ view: UIView, _ direction: Direction) -> Void {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            
            switch direction {
            case .left:
                view.center.x -= self.view.bounds.width
            case .right:
                view.center.x += self.view.bounds.width
            }
            self.currentIndex = index
        }) { (done) in
            self.removeOldViews(self.contentView)
        }
    }
        
    /*
     MARK: - Navigation
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let categoryPageVC = segue.destination as? CategoryPageVC {
            self.categoryPageVC = categoryPageVC
        }
    }
}

extension DashboardVC: CategoryPageVCDelegate {
    func categoryPageViewController(_ categoryPageViewController: CategoryPageVC, didUpdatePageIndex index: Int, swipeDirection direction: Direction) {
        
        let VC = getCurrentVC(getViewId(index))
        self.addChildViewController(VC)
        addSubview(subView: VC.view, toView: self.contentView)
        animateViews(index, VC.view, direction)
    }
}
