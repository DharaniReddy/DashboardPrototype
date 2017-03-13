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
    case video = "Video"
    case article = "Article"
}

class CardParser {
    
    static let sharedInstance = CardParser()
    private init() {}
    fileprivate var cardsArray = [EngagementCardProtocol]()
    
    func engagementCardsData(_ dataFromServer: Data) -> [EngagementCards]{
        let json = JSON(data: dataFromServer)
        let cards = json["cards"].arrayValue
        var cardsArray: [EngagementCards] = []
        for card in cards {
//            let id = card["id"].stringValue
            let title = card["title"].stringValue
//            let type = card["type"].stringValue
            let imageUrl = card["imageUrl"].stringValue
            let lastUpdated = card["lastUpdated"].stringValue
            let articleLink = card["articleLink"].stringValue
            let shortDescription = card["shortDescription"].stringValue
            let pointsAvailable = card["pointsAvailable"].intValue
            let isRecommend = card["isRecommend"].boolValue

            let contentType = card["contentType"].stringValue
            let contentIdentifier = card["contentIdentifier"].stringValue
            let displayPriority = card["displayPriority"].intValue
            
            let engagementCard = EngagementCards(imageUrl: imageUrl, isRecommend: isRecommend, lastUpdated: lastUpdated, articleLink: articleLink, shortDescription: shortDescription, contentType: contentType, contentIdentifier: contentIdentifier, displayPriority: displayPriority, pointsAvailable: pointsAvailable, title: title, description: shortDescription)
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
