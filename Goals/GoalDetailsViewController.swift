//
//  GoalDetailsViewController.swift
//  DashboardPrototype
//
//  Created by Trupti on 14/02/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class GoalDetailsViewController: UIViewController {

    @IBOutlet weak var cicleView: UIView!
    
    @IBOutlet weak var createGoal: UIButton!
    
    @IBOutlet weak var closeGoal: UIButton!
    let color = UIColor(red: 1, green: 130/255, blue: 0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleButton(createGoal)
        circleButton(closeGoal)
    }
    
    func circleButton(_ view: UIView){
        view.layer.cornerRadius = 5.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = color.cgColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addCircleToView(frame: cicleView.frame, borderWidth: 7, borderColor: color)
    }
    
    func addCircleToView(frame:CGRect, borderWidth: CGFloat, borderColor: UIColor) {
        let circleView = CircleView(frame: frame, width: borderWidth, drawColor: borderColor)
        self.view.addSubview(circleView)
        circleView.animateCircle(duration: 1.0, toValue: 0.8)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
