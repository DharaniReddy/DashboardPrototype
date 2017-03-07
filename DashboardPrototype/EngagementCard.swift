//
//  EngagementCard.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/1/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation

protocol EngagementCardProtocol {
    var cardID: Int? { get set }
    var cardTitle: String? { get set }
    var cardType: String? { get set }
    var cardPoints: Int? { get set }
}

struct EngagementCards: EngagementCardProtocol {
    var cardID: Int? = 0
    var cardTitle: String? = "Title"
    var cardType: String? = "Type"
    var cardPoints: Int? = 150
}
