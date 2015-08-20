//
//  TrainingDetails.swift
//  Fit Fuse
//
//  Created by Nicholas Piccoli on 16/08/15.
//  Copyright (c) 2015 Nicholas Piccoli. All rights reserved.
//

import Foundation
import CoreData

class TrainingDetails: NSManagedObject {

    @NSManaged var exerciseName: String
    @NSManaged var repsNumber: String
    @NSManaged var setsNumber: String
    @NSManaged var trainingDay: TrainingDay

}
