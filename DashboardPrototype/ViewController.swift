//
//  ViewController.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 2/6/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit
import iCarousel

class ViewController: UIViewController, iCarouselDelegate, iCarouselDataSource{

    // View Outlets
    @IBOutlet weak var LabelTitle: UILabel!
    
    @IBOutlet weak var carousel: iCarousel!
    var data: [[Int:String]] = [
        [1 : "one"],
        [2 : "two"],
        [3 : "three"],
        [4 : "four"],
        [5 : "five"],
        [6 : "six"],
        [7 : "seven"],
        [8 : "eight"],
        [9 : "nine"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carousel.type = .coverFlow
        carousel.scrollToItem(at: data.count/2, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfItems(in carousel: iCarousel) -> Int {
        return data.count
    }
    
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let imageView: UIView
        let label = UILabel(frame: CGRect(x: 0, y: 150, width: 200, height: 50))
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        if view != nil {
            imageView = view!
        } else {
            imageView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            imageView.backgroundColor = UIColor(red: 69/255.0, green: 195/255.0, blue: 171/255.0, alpha: 1.0)
            
            backgroundImage.image = UIImage(named: getImageName(atIndex: index))
            
            label.text = getSelectDataText(index)
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.font = UIFont(name: label.font.fontName, size: 36)
        }
        
        imageView.addSubview(backgroundImage)
        //imageView.addSubview(label)
        
        return imageView
    }

    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        let currentViewIndex = carousel.currentItemIndex
        LabelTitle.text = getSelectedIndexText(indexValue: currentViewIndex)
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
    return ["Friends & Family", "Fitness", "Points", "Nutrition", "Trackers", "Health Assessment", "", "", ""][index]
}

func getImageName(atIndex index: Int) -> String {
    return ["familytogether", "fitness", "points", "nutrition", "trackers", "assessment", "familytogether", "fitness", "trackers"][index]
}
