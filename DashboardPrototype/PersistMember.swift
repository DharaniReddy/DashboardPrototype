//
//  PersistMember.swift
//  DashboardPrototype
//
//  Created by Dharani Reddy on 02/03/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation
import RealmSwift

class Member: Object {
    
    dynamic var  memberID: String? = nil
    
    dynamic var enableLifepoints: Bool = false
    dynamic var enableRedeeming: Bool = false
    dynamic var showMessaging: Bool = false
    dynamic var showMyCoach: Bool = false
    dynamic var showCoachingGoals: Bool = false
    dynamic var specialTile: Bool = false
    
    dynamic var isDeviceEnabled: Bool = false
    dynamic var isFitnessEnabled: Bool = false
    dynamic var isNutritionEnabled: Bool = false
    dynamic var hasDeviceConnected: Bool = false
    dynamic var hasNutritionAppConnected: Bool = false
    dynamic var hasAcceptedDeviceTerms: Bool = false
    
    let deviceTOSAgreementID = RealmOptional<Int>()
    
    let configuredGoals = Array<Any>()
    
    dynamic var pointsText: String? = nil
    dynamic var supportPhone: String? = nil
    dynamic var validicUserID: String? = nil
    dynamic var validicAccessToken: String? = nil
}

