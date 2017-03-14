//
//  PersistTracker.swift
//  DashboardPrototype
//
//  Created by Dharani Reddy on 13/03/17.
//  Copyright © 2017 Nathanael Gethers. All rights reserved.
//

import Foundation
import RealmSwift

class Tracker: Object {
    dynamic var memberID: String? = nil
    dynamic var trackerType: String? = nil
    let trackerList = List<TrackerObject>()
}

class TrackerObject: Object {
    dynamic var trackedDate = Date()
    dynamic var trackedValue: String? = nil
}
