//
//  ViewController.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 2/6/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit
import iCarousel
import Spring

class ViewController: UIViewController, iCarouselDelegate, iCarouselDataSource{

    // var for managing VC
    @IBOutlet weak var contentView: UIView!
    weak var currentViewController: UIViewController?
    var currentIndex: Int = 0
    
    // VC Outlets
    @IBOutlet weak var descriptionLabel: SpringLabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var carousel: iCarousel!
    @IBOutlet weak var appointmentViewBox: UIView!
    @IBOutlet weak var messageViewBox: UIView!
    var lastIndex = 0
    var data: [[Int:String]] = [
        [1 : "one"],
        [2 : "two"],
        [3 : "three"]
    ]
    let tilesDescriptions = [
        "The Health app shows your health and fitness information all in one place. To use the Health app, download the latest version of iOS for your iPhone or iPod touch. Then you can track health information from multiple sources, like compatible apps and fitness accessories. Set up health data. Apple Watch data.",
        
        "Some things that we can do to take care of our physical bodies include: Rest. Our body needs a certain amount of hours of sleep every night in order to function properly, Stay emotionally healthy, Do not smoke, abuse alcohol, or abuse drugs."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carousel.type = .coverFlow
        carousel.scrollToItem(at: data.count/2, animated: false)
        carousel.isPagingEnabled = true
    }

    func numberOfItems(in carousel: iCarousel) -> Int {
        return data.count
    }
    
    @IBAction func layoutButton_Tapped(_ sender: Any) {
        
        let trackerEntryVCNC = UIStoryboard("PinterestLayout").instantiateNavigationController("WaterFallNavCon")
        let trackerEntryViewController = trackerEntryVCNC.topViewController as! NTWaterfallViewController
        
        
        present(trackerEntryViewController, animated: true)
    }
    
    
    @IBAction func goalsAction(_ sender: Any) {
        
        let goalsViewController = UIStoryboard(name: "Goals", bundle: nil).instantiateViewController(withIdentifier:"Goals") as! GolasViewController
        
        present(goalsViewController, animated: true)

    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let imageView: UIView
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        backgroundImage.tag = index
        
        if view != nil {
            imageView = view!
        } else {
            imageView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            backgroundImage.image = UIImage(named: getImageName(atIndex: index))
            backgroundImage.center = imageView.center
            backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        }
        
        imageView.addSubview(backgroundImage)
        
        return imageView
    }
   
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        let currentViewIndex = carousel.currentItemIndex
        lastIndex = currentViewIndex
        addNewVC(currentViewIndex)
        removeOldViews(self.contentView)
    }
    
    // Animating the text
    func transitionView(_ currentIndex: Int) {
        if lastIndex == currentIndex {
            return
        }
        else if lastIndex > currentIndex {
            descriptionLabel.animation = "fadeInRight"
        }else {
            descriptionLabel.animation = "fadeInLeft"
        }
        
        descriptionLabel.curve="easeIn"
        descriptionLabel.autostart = true
        descriptionLabel.duration = 0.7
        descriptionLabel.animate()
    }
    
    // gets the string value from local data based on current index of carousel
    func getSelectDataText(_ index: Int) -> String {
        return data[index][index + 1]!
    }
}

func getSelectedIndexText(indexValue index: Int) -> String {
    return ["Health Assessment", "Sync Device", "Friends & Family", "Incentives", "Coach", "Goals", "Challenges", "Tutorials", "Fitness", "Points", "Nutrition", "Trackers"][index]
}

func getImageName(atIndex index: Int) -> String {
    return ["0.jpg", "coach1", "goals"][index]
}

extension UIView {
    func createBox(){        
        self.backgroundColor = UIColor.white
    }
}


class EmptyClassInCurrentBundle { }

extension UIStoryboard {
    
    convenience init(_ name: String) {
        let currentBundle = Bundle(for: EmptyClassInCurrentBundle.self)
        self.init(name: name, bundle:currentBundle)
    }
    
    func instantiateNavigationController(_ identifier: String) -> UINavigationController {
        return instantiateViewController(withIdentifier: identifier) as! UINavigationController
    }
    
}

extension ViewController {
    
    func getVCFromStoryBoard(_ id: String) -> UIViewController {
        let DUViewController = UIStoryboard(name: "Layout2", bundle: nil).instantiateViewController(withIdentifier:id)
        
        return DUViewController
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

    func getCurrentVC(_ id: String) -> UIViewController {
        self.currentViewController = getVCFromStoryBoard(id)
        if let view = self.currentViewController {
            view.view.translatesAutoresizingMaskIntoConstraints = false
        }
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
    
    func addNewVC(_ index: Int) -> Void {
        let VC = getCurrentVC(getViewId(index))
        self.addChildViewController(VC)
        addSubview(subView: VC.view, toView: self.contentView)
    }
}

