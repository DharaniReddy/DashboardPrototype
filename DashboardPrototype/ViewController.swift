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

    @IBOutlet weak var descriptionLabel: SpringLabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var carousel: iCarousel!
    @IBOutlet weak var appointmentViewBox: UIView!
    @IBOutlet weak var messageViewBox: UIView!
    var lastIndex = 0
    var data: [[Int:String]] = [
        [1 : "one"],
        [2 : "two"],
        [3 : "three"],
        [4 : "four"],
        [5 : "five"],
        [6 : "six"],
        [7 : "seven"],
        [8 : "eight"],
        [9 : "nine"],
        [10 : "ten"],
        [11 : "eleven"],
    ]
    let tilesDescriptions = [
        "The Health app shows your health and fitness information all in one place. To use the Health app, download the latest version of iOS for your iPhone or iPod touch. Then you can track health information from multiple sources, like compatible apps and fitness accessories. Set up health data. Apple Watch data.",
        
        "Some things that we can do to take care of our physical bodies include: Rest. Our body needs a certain amount of hours of sleep every night in order to function properly, Stay emotionally healthy, Do not smoke, abuse alcohol, or abuse drugs."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carousel.type = .linear
        carousel.scrollToItem(at: data.count/2, animated: false)
        carousel.isPagingEnabled = true
    }

    func numberOfItems(in carousel: iCarousel) -> Int {
        return data.count
    }
    
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let imageView: UIView
//        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        if view != nil {
            imageView = view!
        } else {
            imageView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            backgroundImage.image = UIImage(named: getImageName(atIndex: index))
//            imageView.backgroundColor = randomColor()
//            backgroundImage.contentMode = UIViewContentMode.scaleAspectFit
            backgroundImage.center = imageView.center
        }
        
        imageView.addSubview(backgroundImage)
        
        return imageView
    }
   
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        let currentViewIndex = carousel.currentItemIndex
        // descriptionLabel.text = tilesDescriptions[currentViewIndex%2]
        // transitionLabel(currentViewIndex)
        lastIndex = currentViewIndex
        titleLabel.text = getSelectedIndexText(indexValue: currentViewIndex)
    }
    
    // Animating the text
    func transitionLabel(_ currentIndex: Int) {
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
    
    // gets a random UIColor value
    func randomColor() -> UIColor {
        var randomRed: CGFloat = CGFloat(arc4random_uniform(256))
        let randomGreen: CGFloat = CGFloat(arc4random_uniform(256))
        let randomBlue: CGFloat = CGFloat(arc4random_uniform(256))
        
        if (randomRed == 255.0 && randomGreen == 255.0 && randomBlue == 255.0) {
            randomRed = CGFloat(arc4random_uniform(128))
        }
        
        return UIColor(red: randomRed/255.0, green: randomGreen/255.0, blue: randomBlue/255.0, alpha: 1.0)
    }
}

func getSelectedIndexText(indexValue index: Int) -> String {
    return ["Health Assessment", "Sync Device", "Friends & Family", "Incentives", "Coach", "Goals", "Challenges", "Tutorials", "Fitness", "Points", "Nutrition", "Trackers"][index]
}

func getImageName(atIndex index: Int) -> String {
    return ["assessment", "trackers", "familytogether", "fitness", "nutrition", "nutrition", "fitness", "assessment", "points", "nutrition", "trackers", "trackers"][index]
}

extension UIView {
    func createBox(){        
        self.backgroundColor = UIColor.white
//        self.layer.borderColor = UIColor.gray.cgColor
//        self.layer.borderWidth = 1
    }
}
