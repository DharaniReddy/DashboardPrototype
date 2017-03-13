//
//  ChallengeCard.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/1/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation

protocol ChallengeCard: EngagementCardProtocol {
    var challengeSomething: String? { get set }
    var totalNumberOfPoeple: Int? { get set }
}

struct Challenge: ChallengeCard {

    internal var challengeSomething: String?
    internal var totalNumberOfPoeple: Int?
    
//  Shared
    internal var imageUrl: String?
    internal var isRecommend: Bool
    internal var lastUpdated: String?
    internal var articleLink: String?
    internal var shortDescription: String?
    
    internal var contentType: String
    internal var contentIdentifier: String?
    internal var displayPriority: Int?
    internal var pointsAvailable: Int?
    internal var title: String?
    internal var description: String?
}
