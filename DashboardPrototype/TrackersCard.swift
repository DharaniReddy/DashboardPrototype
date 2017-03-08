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

struct Trackers: TrackersCard {
    internal var trackerSomething: String?

    internal var id: String
    internal var title: String
    internal var type: String
    internal var points: Int?
    internal var imageUrl: String?
    internal var isRecommend: Bool
    internal var lastUpdated: String?
    internal var articleLink: String?
    internal var shortDescription: String?}
