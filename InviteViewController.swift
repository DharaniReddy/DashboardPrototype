//
//  InviteViewController.swift
//  DashboardPrototype
//
//  Created by Simanchal Pradhan on 2/23/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import UIKit

class InviteViewController: UIViewController {

    @IBOutlet weak var messageContent: UITextView!
    
    @IBOutlet weak var labelWhatsapp: UILabel!
    @IBOutlet weak var labelFBMessenger: UILabel!
    @IBOutlet weak var labelHangout: UILabel!
    @IBOutlet weak var labelMail: UILabel!
    
    @IBOutlet weak var whatsappImage: UIImageView!
    @IBOutlet weak var fbMessengerImage: UIImageView!
    @IBOutlet weak var hangoutImage: UIImageView!
    @IBOutlet weak var mailImage: UIImageView!
    
    var labels: [UILabel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Invite"
        labels = [labelWhatsapp, labelFBMessenger, labelHangout, labelMail]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.transition(with: labelWhatsapp, duration: 0.2, options: .transitionFlipFromLeft, animations: {self.labelWhatsapp.isHidden = false}, completion: nil)
        UIView.transition(with: labelFBMessenger, duration: 0.2, options: .transitionFlipFromLeft, animations: {self.labelFBMessenger.isHidden = false}, completion: nil)
        UIView.transition(with: labelHangout, duration: 0.2, options: .transitionFlipFromLeft, animations: {self.labelHangout.isHidden = false}, completion: nil)
        UIView.transition(with: labelMail, duration: 0.2, options: .transitionFlipFromLeft, animations: {self.labelMail.isHidden = false}, completion: nil)
        
        UIView.transition(with: whatsappImage, duration: 0.2, options: .transitionFlipFromRight, animations: {self.whatsappImage.isHidden = false}, completion: nil)
        UIView.transition(with: fbMessengerImage, duration: 0.2, options: .transitionFlipFromRight, animations: {self.fbMessengerImage.isHidden = false}, completion: nil)
        UIView.transition(with: hangoutImage, duration: 0.2, options: .transitionFlipFromRight, animations: {self.hangoutImage.isHidden = false}, completion: nil)
        UIView.transition(with: mailImage, duration: 0.2, options: .transitionFlipFromRight, animations: {self.mailImage.isHidden = false}, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func inviteWhatsapp(_ sender: Any) {
//        sendMessage()
    }
    
    fileprivate func sendMessage() {
        let msg = messageContent.text!
        let urlWhats = "whatsapp://send?text=\(msg)"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            if let whatsappURL = NSURL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                    UIApplication.shared.open(whatsappURL as URL)
                }
            }
        }
        
    }
}
