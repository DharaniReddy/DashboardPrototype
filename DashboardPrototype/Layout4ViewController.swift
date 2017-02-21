//
//  Layout4ViewController.swift
//  DashboardPrototype
//
//  Created by Dharani Reddy on 21/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class Layout4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension Layout4ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 19
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds.width - 30
        if indexPath.row == 0 {
            return CGSize(width: screenSize , height: (screenSize/2) - 7.5)
        } else {
            return CGSize(width: (screenSize/2) - 7.5 , height: (screenSize/2) - 7.5)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Layout4CollectionCell", for: indexPath) as! Layout4CollectionCell
        let finalFrame = cell.frame
        let translation = collectionView.panGestureRecognizer.translation(in: collectionView.superview)
        if translation.x > 0 {
            cell.frame = CGRect(x: finalFrame.origin.x - 1000, y: -500, width: 0, height: 0)
        } else {
            cell.frame = CGRect(x: finalFrame.origin.x + 1000, y: -500, width: 0, height: 0)
        }
        cell.layoutImage.image = UIImage(named: ["blood_pressure", "snapshotReport", "goals", "emotionalHealth", "manage_stress", "nutrition", "emotionalHealth", "manage_stress", "manage_stress", "emotionalHealth", "manage_stress", "manage_stress", "emotionalHealth", "manage_stress", "manage_stress", "emotionalHealth", "manage_stress", "manage_stress", "emotionalHealth", "manage_stress", "manage_stress", "emotionalHealth", "manage_stress", "manage_stress"][indexPath.row])
        UIView.animate(withDuration: 0.5, animations: {
            cell.frame = finalFrame
        }, completion: { _ in
            cell.pointsView.isHidden = false
            cell.tileTitleLabel.text = ["Complete the Health Assessment", "Quit Tobacco", "Find a Doctor", "Stress Management", "Connect Friends", "Are You At Risk?", "Connect Device", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""][indexPath.row]
            //cell.layoutImage.image = UIImage(named: ["blood_pressure", "snapshotReport", "goals", "emotionalHealth", "manage_stress", "nutrition", "emotionalHealth", "manage_stress", "manage_stress", "emotionalHealth", "manage_stress", "manage_stress", "emotionalHealth", "manage_stress", "manage_stress", "emotionalHealth", "manage_stress", "manage_stress"][indexPath.row])
            cell.pointsLabel.text = ["100", "20", "20", "20", "30", "20", "30", "20", "20", "20", "20", "20", "30", "20", "30", "20", "20", "20", "30", "20", "20", "20", "20", "20", "30", "20", "30", "20", "20"][indexPath.row]
        })
        return cell
    }
}

class Layout4CollectionCell: UICollectionViewCell {
    @IBOutlet fileprivate weak var tileTitleLabel: UILabel!
    @IBOutlet fileprivate weak var layoutImage: UIImageView!
    @IBOutlet fileprivate weak var pointsLabel: UILabel!
    @IBOutlet fileprivate weak var pointsView: UIView!
}
