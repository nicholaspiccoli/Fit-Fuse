//
//  TrainingDay.swift
//  Fit Fuse
//
//  Created by Nicholas Piccoli on 16/08/15.
//  Copyright (c) 2015 Nicholas Piccoli. All rights reserved.
//

import Foundation
import CoreData

class TrainingDay: NSManagedObject {

    @NSManaged var day: String
    @NSManaged var trainingDetails: NSSet

}
