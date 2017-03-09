//
//  EngagementCard.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/1/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation

protocol EngagementCardProtocol {
    var id: String { get set }
    var title: String { get set }
    var type: String { get set }
    var points: Int? { get set }
    var imageUrl: String? { get set }
    var isRecommend: Bool {get set }
    var lastUpdated: String? {get set }
    var articleLink: String? {get set }
    var shortDescription: String? {get set }
}


struct EngagementCards: EngagementCardProtocol {
    internal var id: String
    internal var title: String
    internal var type: String
    internal var points: Int?
    internal var imageUrl: String?
    internal var isRecommend: Bool
    internal var lastUpdated: String?
    internal var articleLink: String?
    internal var shortDescription: String?
}
