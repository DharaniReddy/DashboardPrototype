//
//  StorageController.swift
//  DashboardPrototype
//
//  Created by Nathanael Gethers on 3/7/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation

class StateController {
    fileprivate(set) var cards: [EngagementCardProtocol]
    
    init(cards: [EngagementCardProtocol]) {
        self.cards = cards
    }
    
    func add(_ card: EngagementCardProtocol) -> Void {
        cards.append(card)
    }
}
