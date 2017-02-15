//
//  PlanViewController.swift
//  DashboardPrototype
//
//  Created by Simanchal Pradhan on 2/14/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class PlanViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var sundayButton: UIButton!
    @IBOutlet weak var mondayButton: UIButton!
    @IBOutlet weak var tuesdayButton: UIButton!
    @IBOutlet weak var wednesdayButton: UIButton!
    @IBOutlet weak var thursdayButton: UIButton!
    @IBOutlet weak var fridayButton: UIButton!
    @IBOutlet weak var saturdayButton: UIButton!
    
    var planDictArray = [
        [["title": "Sudnday Plan Title1", "description": "Sudnday Plan Description1"],
         ["title": "Sudnday Plan Title2", "description": "Sudnday Plan Description2"],
         ["title": "Sudnday Plan Title3", "description": "Sudnday Plan Description3"],
         ["title": "Sudnday Plan Title4", "description": "Sudnday Plan Description4"]],
        [["title": "Monday Plan Title1", "description": "Monday Plan Description1"],
         ["title": "Monday Plan Title2", "description": "Monday Plan Description2"],
         ["title": "Monday Plan Title3", "description": "Monday Plan Description3"],
         ["title": "Monday Plan Title4", "description": "Monday Plan Description4"]],
        [["title": "Tuesday Plan Title1", "description": "Tuesday Plan Description1"],
         ["title": "Tuesday Plan Title2", "description": "Tuesday Plan Description2"],
         ["title": "Tuesday Plan Title3", "description": "Tuesday Plan Description3"],
         ["title": "Tuesday Plan Title4", "description": "Tuesday Plan Description4"]],
        [["title": "Wedenesday Plan Title1", "description": "Wedenesday Plan Description1"],
         ["title": "Wedenesday Plan Title2", "description": "Wedenesday Plan Description2"],
         ["title": "Wedenesday Plan Title3", "description": "Wedenesday Plan Description3"],
         ["title": "Wedenesday Plan Title4", "description": "Wedenesday Plan Description4"]],
        [["title": "Thursday Plan Title1", "description": "Thursday Plan Description1"],
         ["title": "Thursday Plan Title2", "description": "Thursday Plan Description2"],
         ["title": "Thursday Plan Title3", "description": "Thursday Plan Description3"],
         ["title": "Thursday Plan Title4", "description": "Thursday Plan Description4"]],
        [["title": "Friday Plan Title1", "description": "Friday Plan Description1"],
         ["title": "Friday Plan Title2", "description": "Friday Plan Description2"],
         ["title": "Friday Plan Title3", "description": "Friday Plan Description3"],
         ["title": "Friday Plan Title4", "description": "Friday Plan Description4"]],
        [["title": "Saturday Plan Title1", "description": "Saturday Plan Description1"],
         ["title": "Saturday Plan Title2", "description": "Saturday Plan Description2"],
         ["title": "Saturday Plan Title3", "description": "Saturday Plan Description3"],
         ["title": "Saturday Plan Title4", "description": "Saturday Plan Description4"]]
    ]
    
    var weekButtons: [UIButton] = []
    var currentButton: UIButton!
    var hexColors = ["6f6526", "c25112", "186b6f", "50dfa7", "ed7575", "8da454", "ff7f99"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = "Plan"
        weekButtons = [sundayButton, mondayButton, tuesdayButton, wednesdayButton, thursdayButton, fridayButton, saturdayButton]
        initializeCurrentButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func initializeCurrentButton() {
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.weekday, from: date)
        currentButton = weekButtons[day - 1]
        currentButton.setTitleColor(UIColor.init(hex: hexColors[currentButton.tag]), for: .normal)
        setButtonBorder(true)
    }
    
    fileprivate func setButtonBorder(_ border_required:Bool=false) {
        if border_required {
            let border = CALayer()
            border.backgroundColor = UIColor.init(hex: hexColors[currentButton.tag]).cgColor
            border.frame = CGRect(x: 0, y: currentButton.frame.height, width: currentButton.frame.width, height: 1)
            currentButton.layer.addSublayer(border)
        } else {
            for layer: CALayer in currentButton.layer.sublayers! {
                if layer.contents == nil {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
    
    
    @IBAction func weekDaysButton_Tapped(_ sender: UIButton) {
        let buttonTag = currentButton.tag
        currentButton.setTitleColor(UIColor.init(hex: "555555"), for: .normal)
        setButtonBorder()
        currentButton = sender
        currentButton.setTitleColor(UIColor.init(hex: hexColors[currentButton.tag]), for: .normal)
        setButtonBorder(true)
        if currentButton.tag >= buttonTag {
            UIView.transition(with: tableView, duration: 1.0, options: .transitionCurlDown, animations: {self.tableView.reloadData()}, completion: nil)
        } else {
            UIView.transition(with: tableView, duration: 1.0, options: .transitionCurlUp, animations: {self.tableView.reloadData()}, completion: nil)
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanCell", for: indexPath) as? PlanCell
        cell?.planTitle.text = planDictArray[currentButton.tag][indexPath.row]["title"]
        cell?.planDescription.text = planDictArray[currentButton.tag][indexPath.row]["description"]
        cell?.tickMarkView.layer.backgroundColor = UIColor.init(hex: hexColors[currentButton.tag]).cgColor
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
  
}
