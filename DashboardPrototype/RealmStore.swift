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
            let members = realm.objects(Member.self).filter("memberID CONTAINS '123456'")
            guard members.count > 0 else {
                createMember(realm: realm)
                return
            }
            members.first?.memberID = "123456"
            
            members.first?.pointsText = "Blue"
            members.first?.supportPhone = "8226156242"
            members.first?.validicUserID = "654321"
            members.first?.validicAccessToken = "8hjdyutwtywgeyueu3"
            
            members.first?.enableLifepoints = true
            members.first?.enableRedeeming = true
            members.first?.hasAcceptedDeviceTerms = true
            members.first?.hasDeviceConnected = false
            members.first?.isDeviceEnabled = true
            members.first?.hasNutritionAppConnected = true
            try! realm.commitWrite()
        }
        
        try! realm.write {
            let trckers = realm.objects(Tracker.self)
            guard trckers.count > 0 else {
                insertTrackers(realm: realm)
                return
            }
        }
    }
    
    class func createMember(realm: Realm) {
        
        let data = "{\"memberID\": \"123456\", \"enableLifepoints\": true, \"enableRedeeming\": true, \"showMessaging\": true, \"showMyCoach\": false, \"showCoachingGoals\": false, \"specialTile\": true, \"isDeviceEnabled\": true, \"isFitnessEnabled\": true, \"hasDeviceConnected\": true, \"hasNutritionAppConnected\": false, \"hasAcceptedDeviceTerms\": false, \"deviceTOSAgreementID\": 123, \"pointsText\": \"123456\", \"supportPhone\": \"123456\", \"validicUserID\": \"123456\", \"validicAccessToken\": \"123456\"}".data(using: .utf8)!
        
        let json = try! JSONSerialization.jsonObject(with: data, options: [])
        realm.create(Member.self, value: json, update: false)
        
//        var member = realm.create(Member.self)
//        member.memberID = "123456"
//        member = updateMember(member: member)
        try! realm.commitWrite()
    }
    
    class func insertTrackers(realm: Realm) {
        let tracker = realm.create(Tracker.self)
        tracker.memberID = "123456"
        tracker.trackerType = "Stress"
        
        let stress1 = realm.create(TrackerObject.self)
        stress1.trackedDate = Date()
        stress1.trackedValue = "3"
        
        let stress2 = realm.create(TrackerObject.self)
        stress2.trackedDate = Date()
        stress2.trackedValue = "1"
        
        let stress3 = realm.create(TrackerObject.self)
        stress3.trackedDate = Date()
        stress3.trackedValue = "4"
        
        tracker.trackerList.append(stress3)
        tracker.trackerList.append(stress2)
        tracker.trackerList.append(stress1)
        
        let tracker1 = realm.create(Tracker.self)
        tracker1.memberID = "123456"
        tracker1.trackerType = "Blood Pressure"
        
        let bp1 = realm.create(TrackerObject.self)
        bp1.trackedDate = Date()
        bp1.trackedValue = "120/80"
        
        let bp2 = realm.create(TrackerObject.self)
        bp2.trackedDate = Date()
        bp2.trackedValue = "112/80"
        
        let bp3 = realm.create(TrackerObject.self)
        bp3.trackedDate = Date()
        bp3.trackedValue = "140/90"
        
        tracker1.trackerList.append(bp3)
        tracker1.trackerList.append(bp2)
        tracker1.trackerList.append(bp1)
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
