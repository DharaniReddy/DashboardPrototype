//
//  ArticleCard.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/13/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation

protocol ArticleCard: EngagementCardProtocol {
    var imageUrl: String? { get set }
    var isRecommend: Bool { get set }
    var lastUpdated: String? { get set }
    var articleLink: String? { get set }
    var shortDescription: String? { get set }
}

struct Article: ArticleCard {
    // Shared
    internal var contentType: String
    internal var contentIdentifier: String?
    internal var displayPriority: Int?
    internal var pointsAvailable: Int?
    internal var title: String?
    internal var description: String?
    
    // Not Shared
    internal var imageUrl: String?
    internal var isRecommend: Bool
    internal var lastUpdated: String?
    internal var articleLink: String?
    internal var shortDescription: String?
}
