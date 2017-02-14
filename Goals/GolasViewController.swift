//
//  GolasViewController.swift
//  DashboardPrototype
//
//  Created by Trupti on 13/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class GolasViewController: UIViewController {
    let colors = [UIColor(red: 206/255, green: 234/255, blue: 67/255, alpha: 1), UIColor(red: 1, green: 130/255, blue: 0, alpha: 1.0), UIColor.darkGray]
    let goals = ["My Fitness", "Nutrition"]
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension GolasViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return goals.count
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "goalsCollectionViewCell1", for: indexPath) as! GoalsCollectionViewCell
            cell.imageView.image = UIImage(named: "goal2")
            
            return cell;
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "goalsCollectionViewCell2", for: indexPath) as! GoalsCollectionViewCell
            cell.goalName.text = goals[indexPath.row]
            cell.goalImageView.image = UIImage(named: "goalbg")
            cell.completedLabel.text = "\(Int(0.8 * 100)) days"
            cell.remainingDays.text = "30 days Remaining"

            cell.goalImageView.layer.cornerRadius = cell.goalImageView.frame.width/2
            cell.goalImageView.layer.masksToBounds = true
            let color = colors[indexPath.row % 2]
            cell.remainingDays.textColor = color
            addCircleToView( cell.circleView, frame: CGRect(x: 0, y: 0, width: 80,height: 80), borderWidth: 6, borderColor: color)
            if goals[indexPath.row] == goals[0]{
                configWeekView(cell, color: color)
            }

            return cell;
            
        default:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "goalsCollectionViewCell2", for: indexPath) as! GoalsCollectionViewCell
        }

    }
    func configWeekView(_ cell: GoalsCollectionViewCell, color: UIColor) {
        let xPosition = Int(cell.daysCircleView.frame.maxX)
        let circleYPos = Int(cell.daysCircleView.frame.origin.y)
        let textYPos = Int(cell.daysNameLabel.frame.origin.y)
        
        let labelTexts = ["S", "M", "T", "W", "T", "F", "S"]
        
        for i in 0...6 {
            
            let xPos = xPosition+(i*7)+(i*18)
            let labelCircle = UILabel(frame: CGRect(x: xPos, y:circleYPos, width: 18, height:  18))
            labelCircle.backgroundColor = UIColor.clear
            cell.addSubview(labelCircle)
            
            
            addCircleToView( labelCircle, frame: CGRect(x: 0, y: 0, width: 15,height: 15), borderWidth: 2, borderColor: color)
            
            let labelName = UILabel(frame: CGRect(x: xPos, y: textYPos, width: 18, height:  18))
            labelName.backgroundColor = UIColor.clear
            labelName.text = labelTexts[i]
            labelName.textAlignment = .center
            labelName.textColor = colors[2]
            labelName.font = UIFont(name: cell.daysNameLabel.font.fontName, size: 14)
            cell.addSubview(labelName)
        }
        
    }
    func addCircleToView(_ view: UIView,frame:CGRect, borderWidth: CGFloat, borderColor: UIColor) {
        let circleView = CircleView(frame: frame, width: borderWidth, drawColor: borderColor)
        view.addSubview(circleView)
        circleView.animateCircle(duration: 1.0, toValue: 0.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = self.view.frame.size.width
        switch indexPath.section {
        case 0:
            return CGSize(width: screenWidth , height: screenWidth/2)
        default:
            return CGSize(width: screenWidth , height: 120)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "details", sender: nil)
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

    @IBOutlet weak var daysCircleView: UILabel!
    @IBOutlet weak var daysNameLabel: UILabel!
    @IBOutlet weak var remainingDays: UILabel!
}
