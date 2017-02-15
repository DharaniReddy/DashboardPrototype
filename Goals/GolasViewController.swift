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
    let goalsNames = ["Nutrition", "Blood Pressure", "Colesterol"]
    let images = ["nutritionImg","bloodpressure", "goalbg"]

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
        return 3
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return goalsNames.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "goalsCollectionViewCell1", for: indexPath) as! GoalsCollectionViewCell
            cell.imageView.image = UIImage(named: "goalbg")
            
            return cell;
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "goalsCollectionViewCell2", for: indexPath) as! GoalsCollectionViewCell
            cell.goalName.text = "My Fitness (Active- Recommend)"
            circleImage(cell.goalImageView, imageName: "fitness")
            cell.completedLabel.text = "\(Int(0.8 * 100)) days"
            addCircleToView( cell.circleView, frame: CGRect(x: 0, y: 0, width: 80,height: 80), borderWidth: 6, borderColor: colors[0], completePercentage: 0.8)
            configWeekView(cell, color: colors[1])
            return cell;
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "goalsCollectionViewCell3", for: indexPath) as! GoalsCollectionViewCell
            cell.goalName.text = goalsNames[indexPath.row]
            circleImage(cell.goalImageView, imageName: images[indexPath.row])
            circleButton(cell.trackGoal)
            circleButton(cell.closeGoal)
            return cell
        }
    }
    func configWeekView(_ cell: GoalsCollectionViewCell, color: UIColor) {
        let xPosition = Int(cell.daysCircleView.frame.maxX)
        let circleYPos = Int(cell.daysCircleView.frame.origin.y)
        let textYPos = Int(cell.daysNameLabel.frame.origin.y)
        
        let labelTexts = ["S", "M", "T", "W", "T", "F", "S"]
        let percentage = [0.2, 0.9, 0.3, 0.7, 0.4, 0.8, 0.5]
        for i in 0...6 {
            
            let xPos = xPosition+(i*7)+(i*18)
            let labelCircle = UILabel(frame: CGRect(x: xPos, y:circleYPos, width: 18, height:  18))
            labelCircle.backgroundColor = UIColor.clear
            cell.addSubview(labelCircle)
            addCircleToView( labelCircle, frame: CGRect(x: 0, y: 0, width: 15,height: 15), borderWidth: 2, borderColor: color, completePercentage: percentage[i])
            
            let labelName = UILabel(frame: CGRect(x: xPos, y: textYPos, width: 18, height:  18))
            labelName.backgroundColor = UIColor.clear
            labelName.text = labelTexts[i]
            labelName.textAlignment = .center
            labelName.textColor = colors[2]
            labelName.font = UIFont(name: cell.daysNameLabel.font.fontName, size: 14)
            cell.addSubview(labelName)
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = self.view.frame.size.width
        switch indexPath.section {
        case 0:
            return CGSize(width: screenWidth , height: screenWidth/1.7)
        default:
            return CGSize(width: screenWidth , height: 120)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            self.performSegue(withIdentifier: "details", sender: nil)
        }
    }
    
    func circleImage(_ view: UIImageView, imageName: String){
        view.image = UIImage(named: imageName)
        view.layer.cornerRadius = view.frame.width/2
        view.layer.masksToBounds = true
    }
    
    func circleButton(_ view: UIView){
        view.layer.cornerRadius = 5.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = colors[1].cgColor
    }

    func addCircleToView(_ view: UIView,frame:CGRect, borderWidth: CGFloat, borderColor: UIColor, completePercentage: Double) {
        let circleView = CircleView(frame: frame, width: borderWidth, drawColor: borderColor)
        view.addSubview(circleView)
        circleView.animateCircle(duration: 1.0, toValue: CGFloat(completePercentage))
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
    
    
    @IBOutlet weak var trackGoal: UIButton!
    @IBOutlet weak var closeGoal: UIButton!

}
