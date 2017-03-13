//
//  FriendsAndFamilyCard.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/1/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation

protocol FriendsAndFamilyCard: EngagementCardProtocol {
    var friendsAndFamilySomething: String? { get set }
}

struct FriendsAndFamilyCardStruct: FriendsAndFamilyCard {
    internal var friendsAndFamilySomething: String?
    
    // Shared
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
