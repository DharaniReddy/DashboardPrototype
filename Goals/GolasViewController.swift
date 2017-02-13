//
//  GolasViewController.swift
//  DashboardPrototype
//
//  Created by Trupti on 13/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class GolasViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension GolasViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 2
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "goalsCollectionViewCell1", for: indexPath) as! GoalsCollectionViewCell
            cell.imageView.image = UIImage(named: "goalbg")
            
            return cell;
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "goalsCollectionViewCell2", for: indexPath) as! GoalsCollectionViewCell
            cell.goalName.text = "Goal Nutrition \(indexPath.row + 1)"
            cell.goalImageView.image = UIImage(named: "goalbg")
            cell.goalImageView.layer.cornerRadius = cell.goalImageView.frame.width/2
            cell.goalImageView.layer.masksToBounds = true
            addCircleView(cell)
            return cell;
        }

    }
    
    func addCircleView(_ cell: GoalsCollectionViewCell) {
        
        let circleView = CircleView(frame: CGRect(x: 0, y: 0, width: cell.circleView.frame.width,height: cell.circleView.frame.height), width: 8, drawColor: UIColor(red: 206/255, green: 234/255, blue: 67/255, alpha: 1))
        
        cell.circleView.addSubview(circleView)
        circleView.animateCircle(duration: 1.0, toValue: 0.8)
        cell.completedLabel.text = "\(Int(0.8 * 100)) "
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = self.view.frame.size.width
        switch indexPath.section {
        case 0:
            return CGSize(width: screenWidth , height: screenWidth/1.5)
        default:
            return CGSize(width: screenWidth , height: 150)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    
}



class GoalsCollectionViewCell: UICollectionViewCell {
    //cell 1
    @IBOutlet weak var imageView: UIImageView!
   
    //cell 2
    @IBOutlet fileprivate weak var circleView: CircleView!
    @IBOutlet weak var goalImageView: UIImageView!
    @IBOutlet weak var goalName: UILabel!
    @IBOutlet weak var completedLabel: UILabel!

}
