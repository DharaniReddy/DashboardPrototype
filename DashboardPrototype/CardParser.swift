//
//  CardParser.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/1/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation

enum CardTypes: String {
    case Challenge = "Challenge"
    case FriendsFamily = "FriendsFamily"
    case Trackers = "Trackers"
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
        
        switch type {
        case CardTypes.Challenge.rawValue:
            
            let Challenge = ChallengeCardStruct(cardID: card["cardID"] as? Int, cardTitle: card["cardTitle"] as? String, cardType: card["cardType"] as? String, cardPoints: card["cardPoints"] as? Int, challengeSomething: card["challengeSomething"] as? String, totalNumberOfPoeple: 120)
            
            return Challenge
        case CardTypes.FriendsFamily.rawValue:
            
            let FriendsFamily = FriendsAndFamilyCardStruct(cardID: card["cardID"] as? Int, cardTitle: card["cardTitle"] as? String, cardType: card["cardType"] as? String, cardPoints: card["cardPoints"] as? Int, friendsAndFamilySomething: "FriendsFamily")
            
            return FriendsFamily
        default:
            
            let Trackers = TrackersCardStruct(cardID: card["cardID"] as? Int, cardTitle: card["cardTitle"] as? String, cardType: card["cardType"] as? String, cardPoints: card["cardPoints"] as? Int, trackerSomething: "Trackers")
            
            return Trackers
        }
    }
    
}
