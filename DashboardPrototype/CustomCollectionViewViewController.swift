//
//  CustomCollectionViewViewController.swift
//  DashboardPrototype
//
//  Created by Trupti on 10/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class CustomCollectionViewViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,customLayoutDelegate{
    @IBOutlet weak var collectionView: UICollectionView!

    let titles = ["Blood Pressure", "Friends & Family", "Coach", "Goals", "Blood Pressure", "Friends & Family", "Coach", "Goals"]

    let images = ["bloodpressure", "family", "coach", "goals", "bloodpressure", "family", "coach", "goals"]

    var columnCount = 2
    let miniInteriorSpacing = 10
    var lastContentOffset: CGFloat = 50
    override func viewDidLoad() {
        super.viewDidLoad()
        if collectionView.collectionViewLayout.isKind(of: customLayout.self) {
            let layout = customLayout()
            layout.delegate = self
            layout.columnCount=CGFloat(columnCount)
            collectionView.collectionViewLayout = layout;
            collectionView.reloadData()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.label.text = titles[indexPath.row]
        cell.imageView.image = UIImage(named: images[indexPath.row])
        let backgroundColors = [UIColor.orange, UIColor.blue, UIColor.yellow, UIColor.lightGray,UIColor.red, UIColor.brown]
        cell.backgroundColor = backgroundColors[indexPath.row%6]
        return cell;
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0

    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.size.width/2-20
        let heights = [width,2*width, 1.5*width]
        return CGSize(width: width , height: CGFloat(heights[indexPath.row % 3]))

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 10, 0, 10);

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
}
