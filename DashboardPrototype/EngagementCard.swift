//
//  EngagementCard.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/1/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation

protocol EngagementCardProtocol {
    var imageUrl: String? { get set }
    var isRecommend: Bool { get set }
    var lastUpdated: String? { get set }
    var articleLink: String? { get set }
    var shortDescription: String? { get set }
    
    var contentType: String { get set }
    var contentIdentifier: String? { get set }
    var displayPriority: Int? { get set }
    var pointsAvailable: Int? { get set }
    var title: String? { get set }
    var description: String? { get set }
}


struct EngagementCards: EngagementCardProtocol {
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
