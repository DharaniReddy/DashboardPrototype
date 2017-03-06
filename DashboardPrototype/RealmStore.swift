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
            let members = realm.objects(Member.self).filter("memberID contains '123457'")
            guard members.count > 0 else {
                createMember(realm: realm)
                return
            }
            members.first?.memberID = "123456"
            
            members.first?.pointsText = "Blue"
            members.first?.supportPhone = "8226156240"
            members.first?.validicUserID = "654321"
            members.first?.validicAccessToken = "8hjdyutwtywgeyueu3"
            
            members.first?.enableLifepoints = true
            members.first?.enableRedeeming = true
            members.first?.hasAcceptedDeviceTerms = true
            members.first?.hasDeviceConnected = false
            members.first?.isDeviceEnabled = true
            members.first?.hasNutritionAppConnected = true
        }
    }
    
    class func createMember(realm: Realm) {
        var member = realm.create(Member.self)
        member.memberID = "123457"
        member = updateMember(member: member)
        try! realm.commitWrite()
    }
}

func updateMember(member: Member) -> Member {
    //member.memberID = "123456"
    
    member.pointsText = "Blue"
    member.supportPhone = "8226156240"
    member.validicUserID = "654321"
    member.validicAccessToken = "8hjdyutwtywgeyueu3"
    
    member.enableLifepoints = true
    member.enableRedeeming = true
    member.hasAcceptedDeviceTerms = true
    member.hasDeviceConnected = false
    member.isDeviceEnabled = true
    member.hasNutritionAppConnected = true
    return member
}
