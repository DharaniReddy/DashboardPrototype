//
//  Layout4ViewController.swift
//  DashboardPrototype
//
//  Created by Dharani Reddy on 21/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class Layout4ViewController: UIViewController {
    @IBOutlet fileprivate weak var tabBarViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet fileprivate weak var naviBarHeightConstraint: NSLayoutConstraint!
    @IBOutlet fileprivate weak var tabBarTitleLabel: UILabel!
    var cardsArray: [EngagementCardProtocol] = []
    let colors: [UIColor] = [  UIColor(red: 204/255, green: 255/255, blue: 229/255, alpha: 1),
                    UIColor(red: 255/255, green: 204/255, blue: 204/255, alpha: 1),
                    UIColor(red: 204/255, green: 204/255, blue: 255/255, alpha: 1),]
    var previousScrollOffset: CGFloat = 0
    
    var stateController: StateController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true

        // Load JSON File
        let url = Bundle.main.url(forResource: "EngagementFeed", withExtension: "json")
        if let data = NSData(contentsOf: url!) as? Data {
            cardsArray = CardParser.sharedInstance.engagementCardsData(data)
            self.stateController = StateController(cards: cardsArray)
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction private func popController() {
        _ = navigationController?.popViewController(animated: true)
    }

}

extension Layout4ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsArray.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds.width
        if indexPath.row == 0 {
            return CGSize(width: screenSize , height: (screenSize/2))
        } else {
            return CGSize(width: (screenSize/2), height: (screenSize/2))
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let card = cardsArray[indexPath.row]

        var cell:Layout4CollectionCell!
        switch card.contentType {
        case CardTypes.trackers.rawValue :
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "trackerCell", for: indexPath) as! Layout4CollectionCell
            cell.pointsLabel.text = " \(card.pointsAvailable!) PTS "
            
        default:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath) as! Layout4CollectionCell
            cell.videoPlayButton.isHidden = card.contentType != CardTypes.video.rawValue

        }
        
        
        //common
        if let imageUrl = card.imageUrl, imageUrl != "" {
            cell.layoutImage.image = UIImage(named: imageUrl)
        }
        cell.backgroundColor = colors[indexPath.row % 3]

        cell.titleLabel.text = card.title
        cell.descriptionLabel.text = card.shortDescription!

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        
        
        
        
//        if (indexPath.row % 4) == 1 {
//            let goalsViewController = UIStoryboard(name: "Goals", bundle: nil).instantiateViewController(withIdentifier:"Goals") as! GolasViewController
//            navigationController?.pushViewController(goalsViewController, animated: true)
//        } else if (indexPath.row % 4) == 2 {
//            let coachViewController = UIStoryboard(name: "FriendsAndFamily", bundle: nil).instantiateInitialViewController() as! FriendsAndFamilyViewController
//            navigationController?.pushViewController(coachViewController, animated: true)
//        } else if (indexPath.row % 4) == 3 {
//            let coachViewController = UIStoryboard(name: "Coach", bundle: nil).instantiateInitialViewController() as! CoachViewController
//            navigationController?.pushViewController(coachViewController, animated: true)
//        } else {
//            let challengesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"ChallengesViewController") as! ChallengesViewController
//            navigationController?.pushViewController(challengesViewController, animated: true)
//        }
    }
}

//extension Layout4ViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let scrollOffset = scrollView.contentOffset.y
//        var bottomValue = CGFloat(0)
//        var heightValue = CGFloat(0)
//        if (scrollOffset > previousScrollOffset) && scrollOffset != 0 {
//            bottomValue = -30
//            heightValue = 0
//        } else {
//            bottomValue = 0
//            heightValue = 64
//        }
//        previousScrollOffset = scrollOffset
//        UIView.animate(withDuration: 0.5, animations: {
//            self.tabBarTitleLabel.alpha = bottomValue != -30 ? 0.0 : 1.0
//            self.tabBarViewBottomConstraint.constant = bottomValue
//            self.naviBarHeightConstraint.constant = heightValue
//            self.view.layoutIfNeeded()
//        })
//    }
//}

class Layout4CollectionCell: UICollectionViewCell {
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var layoutImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //tracker
    @IBOutlet fileprivate weak var pointsLabel: UILabel!
    @IBOutlet weak var lastUpdatedButton: UIButton!

    //article
    @IBOutlet weak var linkTextView: UITextView!
    @IBOutlet weak var videoPlayButton: UIButton!
    @IBAction func playAction(_ sender: Any) {
    }
    
}
