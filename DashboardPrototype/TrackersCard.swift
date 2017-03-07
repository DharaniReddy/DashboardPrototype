//
//  TrackersCard.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/1/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation

protocol TrackersCard: EngagementCardProtocol {
    var trackerSomething: String? { get set }
}

struct TrackersCardStruct: TrackersCard {
    var cardID: Int? = 1
    var cardTitle: String? = "Title"
    var cardType: String? = "Type"
    var cardPoints: Int? = 150
    var cardImage: String? = "coach1"
    var trackerSomething: String? = "Trackers"
}
