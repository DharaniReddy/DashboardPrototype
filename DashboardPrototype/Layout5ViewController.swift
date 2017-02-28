//
//  Layout5ViewController.swift
//  DashboardPrototype
//
//  Created by Trupti on 28/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class Layout5ViewController: UIViewController {
    let tilesImage = ["challenge","friend&family","coach1","goals"]
    let tilesTitle = ["Challenge", "Friends & Family", "Coach", "Goals"]
    let height: CGFloat =  150
    let collectionViewSpacing: CGFloat = 7
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension Layout5ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tilesTitle.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
         return height+100
        }
        return height+30;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! Layout5TableViewCell
        cell.titleLabel.text = tilesTitle[indexPath.row]
        cell.collectionView.tag = indexPath.row
        return cell
    }
}


extension Layout5ViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tilesTitle.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! Layout5CollectionViewCell
        
        cell.cellImage?.image = UIImage(named: tilesImage[indexPath.row])
//        cell.titleLabel.text = tilesTitle[indexPath.row]
        
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
            return CGSize(width: 2*height , height: height+100-(2*collectionViewSpacing))
        }
        return CGSize(width: height*0.7 , height: height-(2*collectionViewSpacing))
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
    
    @IBOutlet weak var label_verticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var label_horizontalConstraint: NSLayoutConstraint!
}
