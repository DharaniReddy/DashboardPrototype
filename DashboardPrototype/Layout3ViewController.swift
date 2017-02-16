//
//  Layout3ViewController.swift
//  DashboardPrototype
//
//  Created by Trupti on 16/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class Layout3ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    let colors = [UIColor.red, UIColor.clear]
    var cellArray: [Layout3CollectionViewCell] = []
    let titles = ["Blood Pressure", "Friends & Family", "Coach", "Goals", "Blood Pressure", "Friends & Family", "Coach", "Goals"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension Layout3ViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! Layout3CollectionViewCell
        cell.imageView.image = UIImage(named: "menu_icon_\(indexPath.row)")
        cell.tag = indexPath.row
        if !cellArray.contains(cell){
            cellArray.append(cell)
        }
        return cell;
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60 , height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 20, 0, 20);
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        for cellItem in cellArray {
            if cellItem.tag == cell?.tag{
                cellItem.backgroundColor = colors[0]
            }else {
                cellItem.backgroundColor = colors[1]
            }
        }
    }
}


extension Layout3ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! Layout3TableViewCell
        cell.tableviewImage?.image = UIImage(named: "\(indexPath.row).jpg")
        cell.label.text = titles[indexPath.row]
        
        return cell
    }
}


class Layout3TableViewCell: UITableViewCell {
    @IBOutlet weak var tableviewImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel! // not used

}

class Layout3CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!//not used
}
