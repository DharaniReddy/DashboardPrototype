//
//  CardParser.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/1/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation

enum CardTypes: String {
    case challenge = "Challenge"
    case friendsFamily = "FriendsFamily"
    case trackers = "Trackers"
}

class CardParser {
    
    static let sharedInstance = CardParser()
    
    fileprivate var cardsArray = [EngagementCard]()
    
    func parseJSON(JSON data: NSData) -> [String:AnyObject] {
        var json: [String: AnyObject] = ["":"" as AnyObject]
        do {
            // Parse JSON as swift Dict[String: Any]
            json = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
            
        } catch let error as NSError {
            print(error)
        }
        return json
    }
    
    func parse(_ card: [String:AnyObject]) -> EngagementCard {

        let type = card["cardType"] as! String
        let cardType = CardTypes(rawValue: type)
        switch cardType! {
        case .challenge:
            
            let challenge = ChallengeCardStruct(cardID: card["cardID"] as? Int, cardTitle: card["cardTitle"] as? String, cardType: card["cardType"] as? String, cardPoints: card["cardPoints"] as? Int, challengeSomething: card["challengeSomething"] as? String, totalNumberOfPoeple: 120)
            
            return challenge
        case .friendsFamily:
            
            let friendsFamily = FriendsAndFamilyCardStruct(cardID: card["cardID"] as? Int, cardTitle: card["cardTitle"] as? String, cardType: card["cardType"] as? String, cardPoints: card["cardPoints"] as? Int, friendsAndFamilySomething: "FriendsFamily")
            
            return friendsFamily
        case .trackers:
            
            let trackers = TrackersCardStruct(cardID: card["cardID"] as? Int, cardTitle: card["cardTitle"] as? String, cardType: card["cardType"] as? String, cardPoints: card["cardPoints"] as? Int, trackerSomething: "Trackers")
            
            return trackers
        }
    }
    
}
