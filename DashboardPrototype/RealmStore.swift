//
//  RealmStore.swift
//  DashboardPrototype
//
//  Created by Dharani Reddy on 02/03/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation
import RealmSwift

class MemberStore {
    
    class func storeMemberInfo() {
        
        
        let realm = try! Realm()
        try! realm.write {
            let member = realm.create(Member.self)
            member.memberID = "123456"
            
            member.pointsText = "Blue"
            member.supportPhone = "8226156240"
            member.validicUserID = "654321"
            member.validicAccessToken = "8hjdyutwtywgeyueu3"
            
            member.enableLifepoints = true
        }
//        member.enableLifepoints = true
//        member.enableRedeeming = true
//        member.hasAcceptedDeviceTerms = true
//        member.hasDeviceConnected = false
//        member.isDeviceEnabled = true
//        member.hasNutritionAppConnected = true
    }
}
