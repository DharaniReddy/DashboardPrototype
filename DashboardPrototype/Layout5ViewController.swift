//
//  Layout5ViewController.swift
//  DashboardPrototype
//
//  Created by Trupti on 28/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class Layout5ViewController: UIViewController {
    
    var stateController: StateController!
    
    let recommends = ["recommend","recommend1","recommend2","recommend","recommend1"]
    
    var tilesTitle = ["", "Challenge", "Friends & Family", "Coach", "Goals"]
    
    let height: CGFloat =  180
    let width: CGFloat = 150
    let collectionViewSpacing: CGFloat = 7
   
    var cardsArray: [EngagementCardProtocol] = []
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load JSON File
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        let data = NSData(contentsOf: url!)
        cardsArray = CardParser.sharedInstance.parseCardsData(data! as Data)
        self.stateController = StateController(cards: cardsArray)
        
        // let parsedJson = CardParser.sharedInstance.parseJSON(JSON: data!)
        // Grab the 'cards' array from json and cast to EngagementCard
//        if let cards = parsedJson["cards"] as? [AnyObject] {
//            for cardJson in cards {
//                let cardModel = CardParser.sharedInstance.parse(cardJson as! [String : AnyObject])
//                cardsArray.append(cardModel)
//            }
//        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CardDetialVC" {
            if let detailVC = segue.destination as? ChallengeDetailViewViewController {
                    detailVC.card = self.stateController.cards[selectedIndex]
                    detailVC.stateController = self.stateController
            }
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
//            cell.cellImage?.image = UIImage(named: tilesImage[abs(tilesImage.count-indexPath.row-collectionView.tag)])
            cell.cellImage?.image = UIImage(named: card.cardImage!)
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
        self.selectedIndex = indexPath.row
        var card: EngagementCardProtocol!
        card = cardsArray[indexPath.row]
        performSegue(withIdentifier: "CardDetialVC", sender: card)  
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
