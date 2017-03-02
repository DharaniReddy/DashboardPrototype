//
//  ChallengeCard.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/1/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation

protocol ChallengeCard: EngagementCard {
    var challengeSomething: String? { get set }
    var totalNumberOfPoeple: Int? { get set }
}

struct ChallengeCardStruct: ChallengeCard {
    var cardID: Int? = 1
    var cardTitle: String? = "Title"
    var cardType: String? = "Type"
    var cardPoints: Int? = 150
    var challengeSomething: String? = "Challenge"
    var totalNumberOfPoeple: Int? = 0
}
