//
//  Layout5ViewController.swift
//  DashboardPrototype
//
//  Created by Trupti on 28/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit
import LayoutKit

enum CardTypes: String {
    case Challenge = "Challenge"
    case FriendsFamily = "FriendsFamily"
    case Trackers = "Trackers"
}

class Layout5ViewController: UIViewController {
    
    let recommends = ["recommend","recommend1","recommend2","recommend","recommend1"]
 
    let tilesImage = ["recommend2","challenge","friend&family","coach1","goals"]
    
    var tilesTitle = ["", "Challenge", "Friends & Family", "Coach","Goals"]
    
    let height: CGFloat =  180
    let width: CGFloat = 150
    let collectionViewSpacing: CGFloat = 7
   
    var cardsArray: [EngagementCard] = []
    
    func printItem(_ item: EngagementCard, specialSomething special: String?) -> Void {
        print("ID \(item.cardID!)")
        print("Points: \(item.cardPoints!)")
        print("Title: \(item.cardTitle!)")
        print("Type: \(item.cardType!)")
        print("Special: \(special!)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Load JSON File
//        let path = Bundle.main.path(forResource: "data", ofType: "json")
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        let data = NSData(contentsOf: url!)
        do {
            // Parse JSON as swift Dict[String: Any]
            let json = try JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject]
            
            // Grab the 'cards' array from json and cast to EngagementCard
            if let cards = json?["cards"] as? [AnyObject] {
                for index in 0...cards.count - 1 {
                    let card = cards[index]
                    let type = card["cardType"] as! String
                    let cardModel: EngagementCard
                    
                    switch type {
                    case CardTypes.Challenge.rawValue:
                        let Challenge = ChallengeCardStruct(cardID: card["cardID"] as? Int, cardTitle: card["cardTitle"] as? String, cardType: card["cardType"] as? String, cardPoints: card["cardPoints"] as? Int, challengeSomething: "Something1")
//                        let nameLayout = LabelLayout(text: Challenge.cardTitle!, font: UIFont.systemFontOfSize(40))
                        printItem(Challenge, specialSomething: Challenge.challengeSomething)
                        cardsArray.append(Challenge)
//                        tilesTitle.append(Challenge.cardTitle!)
                    case CardTypes.FriendsFamily.rawValue:
                        let FriendsFamily = FriendsAndFamilyCardStruct(cardID: card["cardID"] as? Int, cardTitle: card["cardTitle"] as? String, cardType: card["cardType"] as? String, cardPoints: card["cardPoints"] as? Int, friendsAndFamilySomething: "FriendsFamily")
                        printItem(FriendsFamily, specialSomething: FriendsFamily.friendsAndFamilySomething)
                        cardsArray.append(FriendsFamily)
                    default:
                        let Trackers = TrackersCardStruct(cardID: card["cardID"] as? Int, cardTitle: card["cardTitle"] as? String, cardType: card["cardType"] as? String, cardPoints: card["cardPoints"] as? Int, trackerSomething: "Trackers")
                        printItem(Trackers, specialSomething: Trackers.trackerSomething)
                        cardsArray.append(Trackers)
                    }
                }
            }
        } catch let error as NSError {
            print(error)
        }
        
    }
}

extension Layout5ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
         return height + 70
        }
        return height;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! Layout5TableViewCell
        cell.collectionView.tag = indexPath.row
        if indexPath.row == 0 {
            cell.titleLabel.text = "Recommend"
        }else {
            cell.titleLabel.text = tilesTitle[indexPath.row]
        }
        return cell
    }
}


extension Layout5ViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! Layout5CollectionViewCell
       
        if collectionView.tag == 0 {
            cell.cellImage?.image = UIImage(named: recommends[indexPath.row])
        }else{
            let card = cardsArray[indexPath.row]
            cell.titleLabel.text = card.cardTitle!
            cell.typeLabel.text = card.cardType!
            cell.cellImage?.image = UIImage(named: tilesImage[abs(tilesImage.count-indexPath.row-collectionView.tag)])
        }
        return cell;
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionViewSpacing
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return collectionViewSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 0 {
            return CGSize(width: 2*width , height: width+100-(2*collectionViewSpacing))
        }else{
            return CGSize(width: width*0.7 , height: width-(2*collectionViewSpacing))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, collectionViewSpacing, 0, collectionViewSpacing);
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}



class Layout5TableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var collectionView: UICollectionView!
}

class Layout5CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var label_verticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var label_horizontalConstraint: NSLayoutConstraint!
}
