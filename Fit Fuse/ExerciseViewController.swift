//
//  ExerciseViewController.swift
//  Fit Fuse
//
//  Created by Nicholas Piccoli on 11/08/15.
//  Copyright (c) 2015 Nicholas Piccoli. All rights reserved.
//

import UIKit
import CoreData

class ExerciseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sets stepper configs
        setsStepper.wraps = false
        setsStepper.autorepeat = true
        setsStepper.continuous = true
        setsStepper.tintColor = UIColor.redColor()
        setsStepper.minimumValue = 0
        setsStepper.maximumValue = 500
        setsStepper.value = 0
        
        //reps stepper configs
        repsStepper.wraps = false
        repsStepper.autorepeat = true
        repsStepper.continuous = true
        repsStepper.tintColor = UIColor.orangeColor()
        repsStepper.minimumValue = 0
        repsStepper.maximumValue = 500
        repsStepper.value = 0
        
        exerciseTableView.reloadData()
    }
    
    var moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    var fetchedResultsController: NSFetchedResultsController?

    @IBOutlet var exerciseTableView: UITableView!

    @IBOutlet var dayName: UITextField!
    @IBOutlet var exerciseName: UITextField!
    @IBOutlet var setsStepper: UIStepper!
    @IBOutlet var repsStepper: UIStepper!
    
    @IBOutlet var setsNumber: UILabel!
    @IBOutlet var repsNumber: UILabel!
    
    var daysArray = [TrainingDay]()
    var namesArray = [String]()
    var setsArray = [Int]()
    var repsArray = [Int]()
    
    func appendTrainingDay() {
        let dayLabel = dayName.text
        let dayEntity = NSEntityDescription.entityForName("TrainingDay", inManagedObjectContext: moc!)
        let newTrainingDay = TrainingDay(entity: dayEntity!, insertIntoManagedObjectContext: moc)
        newTrainingDay.day = dayName.text
        
        var error: NSError?
        moc?.save(&error)
        
        if let err = error {
            var status = err.localizedFailureReason
            println("\(status)")
        } else {
            println("Training day:\(dayName.text)")
    }
}

    func appendTrainingDetailsToArray () {
        let nameLabel = exerciseName.text
        namesArray.append(nameLabel)
        let numberOfSets = setsNumber.text?.toInt()
        setsArray.append(numberOfSets!)
        let numberOfReps = repsNumber.text?.toInt()
        repsArray.append(numberOfReps!)
        
        
        let detailsEntity = NSEntityDescription.entityForName("TrainingDetails", inManagedObjectContext: moc!)
        let trainingdetails = TrainingDetails(entity: detailsEntity!, insertIntoManagedObjectContext: moc)
        trainingdetails.exerciseName = exerciseName.text
        trainingdetails.setsNumber = setsNumber.text!
        trainingdetails.repsNumber = repsNumber.text!
        
        let fetchRequest = NSFetchRequest(entityName: "TrainingDay")
        daysArray = (moc!.executeFetchRequest(fetchRequest, error: nil) as? [TrainingDay])!
        
        for chosenDay in daysArray {
            println(chosenDay.day)
            if chosenDay == dayName.text {
                println("CHOSEN DAY IS:\(chosenDay)")
                trainingdetails.trainingDay = chosenDay
            }
        }
            
        var error: NSError?
        moc?.save(&error)
        
        if let err = error {
            var status = err.localizedFailureReason
            println("\(status)")
        } else {
            println("Exercise: #\(exerciseName.text) saved successfully!")
            println("Number of sets: #\(setsNumber.text) saved successfully!")
            println("Number of reps: #\(repsNumber.text) saved successfully!")
        }
    }
    
    @IBAction func fixDayButton(sender: AnyObject) {
        appendTrainingDay()
    }
    
    
    @IBAction func doneButton(sender: AnyObject) {
        appendTrainingDetailsToArray()
        exerciseTableView.reloadData()
    }
    
    @IBAction func setsStepperAction(sender: UIStepper) {
        println("\(Int(sender.value))")
        setsNumber.text = Int(sender.value).description
    }
    
    @IBAction func repsStepper(sender: UIStepper) {
        println("\(Int(sender.value))")
        repsNumber.text = Int(sender.value).description
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "exerciseCell"
var cell  = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: cellIdentifier)
        }
        let row = indexPath.row
        let name = namesArray[indexPath.row]
        let numberReps = repsArray[indexPath.row]
        let numberSets = setsArray[indexPath.row]
            cell!.textLabel!.text = name
        cell?.detailTextLabel?.text = "Sets: #\(numberSets) Reps: #\(numberReps)"
        return cell!
    }
}
