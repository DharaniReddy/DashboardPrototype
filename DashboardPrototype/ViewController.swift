//
//  ViewController.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 2/6/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit
import iCarousel
import Spring

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func layoutButton_Tapped(_ sender: Any) {
        
        let trackerEntryVCNC = UIStoryboard("PinterestLayout").instantiateNavigationController("WaterFallNavCon")
        let trackerEntryViewController = trackerEntryVCNC.topViewController as! NTWaterfallViewController
        
        
        present(trackerEntryViewController, animated: true)
    }
    
    @IBAction func layoutButton2_Tapped(_ sender: Any) {
    
        let DashboardVC = UIStoryboard("Layout2").instantiateNavigationController("WaterFallNavCon")
        let trackerEntryViewController = DashboardVC.topViewController as! DashboardVC
        
        
        present(trackerEntryViewController, animated: true)
    }
    
    @IBAction func goalsAction(_ sender: Any) {
        
        let goalsViewController = UIStoryboard(name: "Goals", bundle: nil).instantiateViewController(withIdentifier:"Goals") as! GolasViewController
        
        present(goalsViewController, animated: true)

    }
}


class EmptyClassInCurrentBundle { }

extension UIStoryboard {
    
    convenience init(_ name: String) {
        let currentBundle = Bundle(for: EmptyClassInCurrentBundle.self)
        self.init(name: name, bundle:currentBundle)
    }
    
    func instantiateNavigationController(_ identifier: String) -> UINavigationController {
        return instantiateViewController(withIdentifier: identifier) as! UINavigationController
    }
    
}
