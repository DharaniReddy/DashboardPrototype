//
//  EngagementCard.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/1/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation

protocol EngagementCard {
    var cardID: Int? { get set }
    var cardTitle: String? { get set }
    var cardType: String? { get set }
    var cardPoints: Int? { get set }
}
