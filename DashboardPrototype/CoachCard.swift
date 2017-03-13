//
//  CoachCard.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/13/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation

protocol CoachCard: EngagementCardProtocol {
    var coachImageUrl: String? { get set }
    var coachPhoneNumber: String? { get set }
    var coachName: String? { get set }
    var coachEmail: String? { get set }
    var message: String? { get set }
    var appointmentDate: Date? { get set }
}

struct Coach: CoachCard {
    // Shared
    internal var contentType: String
    internal var contentIdentifier: String?
    internal var displayPriority: Int?
    internal var pointsAvailable: Int?
    internal var title: String?
    internal var description: String?
    
    // Not Shared
    internal var coachImageUrl: String?
    internal var coachPhoneNumber: String?
    internal var coachName: String?
    internal var coachEmail: String?
    internal var message: String?
    internal var appointmentDate: Date?

    internal var imageUrl: String?
    internal var isRecommend: Bool
    internal var lastUpdated: String?
    internal var articleLink: String?
    internal var shortDescription: String?
}
