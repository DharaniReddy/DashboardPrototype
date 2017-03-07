//
//  CardParser.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/1/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation
import SwiftyJSON

enum CardTypes: String {
    case challenge = "Challenge"
    case friendsFamily = "FriendsFamily"
    case trackers = "Trackers"
}

class CardParser {
    
    static let sharedInstance = CardParser()
    private init() {}
    fileprivate var cardsArray = [EngagementCardProtocol]()
    
    func parseCardsData(_ dataFromServer: Data) -> [EngagementCards]{
        let json = JSON(data: dataFromServer)
        let cards = json["cards"].arrayValue
        var cardsArray: [EngagementCards] = []
        for card in cards {
            let cardID = card["cardID"].intValue
            let cardTitle = card["cardTitle"].stringValue
            let cardPoints = card["cardPoints"].intValue
            let cardType = card["cardType"].stringValue

            let engagementCard = EngagementCards(cardID: cardID, cardTitle: cardTitle, cardType: cardType, cardPoints: cardPoints)
            cardsArray.append(engagementCard)
        }
        return cardsArray
    }
    
        //
//    func parseJSON(JSON data: NSData) -> [String:AnyObject] {
//        var json: [String: AnyObject] = ["":"" as AnyObject]
//        do {
//            // Parse JSON as swift Dict[String: Any]
//            json = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
//            
//        } catch let error as NSError {
//            print(error)
//        }
//        return json
//    }
//    
//    func parse(_ card: [String:AnyObject]) -> EngagementCardProtocol {
//
//        let type = card["cardType"] as! String
//        let cardType = CardTypes(rawValue: type)
//        switch cardType! {
//        case .challenge:
//            
//            let challenge = ChallengeCardStruct(cardID: card["cardID"] as? Int, cardTitle: card["cardTitle"] as? String, cardType: card["cardType"] as? String, cardPoints: card["cardPoints"] as? Int, challengeSomething: card["challengeSomething"] as? String, totalNumberOfPoeple: 120)
//            
//            return challenge
//        case .friendsFamily:
//            
//            let friendsFamily = FriendsAndFamilyCardStruct(cardID: card["cardID"] as? Int, cardTitle: card["cardTitle"] as? String, cardType: card["cardType"] as? String, cardPoints: card["cardPoints"] as? Int, friendsAndFamilySomething: "FriendsFamily")
//            
//            return friendsFamily
//        case .trackers:
//            
//            let trackers = TrackersCardStruct(cardID: card["cardID"] as? Int, cardTitle: card["cardTitle"] as? String, cardType: card["cardType"] as? String, cardPoints: card["cardPoints"] as? Int, trackerSomething: "Trackers")
//            
//            return trackers
//        }
//    }
    
}
