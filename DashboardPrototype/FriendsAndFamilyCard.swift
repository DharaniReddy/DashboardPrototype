//
//  FriendsAndFamilyCard.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/1/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation

protocol FriendsAndFamilyCard: EngagementCard {
    var friendsAndFamilySomething: String? { get set }
}

struct FriendsAndFamilyCardStruct: FriendsAndFamilyCard {
    var cardID: Int? = 1
    var cardTitle: String? = "Title"
    var cardType: String? = "Type"
    var cardPoints: Int? = 150
    var friendsAndFamilySomething: String? = "FriendsFamily"
}
