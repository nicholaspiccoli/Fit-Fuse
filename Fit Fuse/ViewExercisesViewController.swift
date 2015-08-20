//
//  ViewExercisesViewController.swift
//  Fit Fuse
//
//  Created by Nicholas Piccoli on 13/08/15.
//  Copyright (c) 2015 Nicholas Piccoli. All rights reserved.
//

import UIKit
import CoreData

class ViewExercisesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    override func viewDidLoad() {
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchTrainingDetails(), managedObjectContext: moc!, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController?.delegate = self
        fetchedResultsController?.performFetch(nil)
        self.viewExerciseTableView.reloadData()

        
        sundayButton.frame = CGRectMake(-30,50,125,125)
        sundayButton.addTarget(self, action: "sundayButtonTouch:", forControlEvents: UIControlEvents.TouchDown)
        sundayButton.setImage(imageSunday, forState: .Normal)
        sundayButton.imageEdgeInsets = UIEdgeInsetsMake(30,30,30,30)
        self.view.addSubview(sundayButton)
        
        mondayButton.frame = CGRectMake(120,50,125,125)
        mondayButton.addTarget(self, action: "mondayButtonTouch:", forControlEvents: UIControlEvents.TouchDown)
        mondayButton.setImage(imageMonday, forState: .Normal)
        mondayButton.imageEdgeInsets = UIEdgeInsetsMake(30,30,30,30)
        self.view.addSubview(mondayButton)
        
        tuesdayButton.frame = CGRectMake(270,50,125,125)
        tuesdayButton.addTarget(self, action: "tuesdayButtonTouch:", forControlEvents: UIControlEvents.TouchDown)
        tuesdayButton.setImage(imageTuesday, forState: .Normal)
        tuesdayButton.imageEdgeInsets = UIEdgeInsetsMake(30,30,30,30)
        self.view.addSubview(tuesdayButton)
        
        wednesdayButton.frame = CGRectMake(-30,150,125,125)
        wednesdayButton.addTarget(self, action: "wednesdayButtonTouch:", forControlEvents: UIControlEvents.TouchDown)
        wednesdayButton.setImage(imageWednesday, forState: .Normal)
        wednesdayButton.imageEdgeInsets = UIEdgeInsetsMake(30,30,30,30)
        self.view.addSubview(wednesdayButton)
        
        thursdayButton.frame = CGRectMake(70,150,125,125)
        thursdayButton.addTarget(self, action: "thursdayButtonTouch:", forControlEvents: UIControlEvents.TouchDown)
        thursdayButton.setImage(imageThursday, forState: .Normal)
        thursdayButton.imageEdgeInsets = UIEdgeInsetsMake(30,30,30,30)
        self.view.addSubview(thursdayButton)
        
        fridayButton.frame = CGRectMake(170,150,125,125)
        fridayButton.addTarget(self, action: "fridayButtonTouch:", forControlEvents: UIControlEvents.TouchDown)
        fridayButton.setImage(imageFriday, forState: .Normal)
        fridayButton.imageEdgeInsets = UIEdgeInsetsMake(30,30,30,30)
        self.view.addSubview(fridayButton)
        
        saturdayButton.frame = CGRectMake(270,150,125,125)
        saturdayButton.addTarget(self, action: "saturdayButtonTouch:", forControlEvents: UIControlEvents.TouchDown)
        saturdayButton.setImage(imageSaturday, forState: .Normal)
        saturdayButton.imageEdgeInsets = UIEdgeInsetsMake(30,30,30,30)
        self.view.addSubview(saturdayButton)

        
    }
    
    //VAR AND LET
    
    var sundayButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    var imageSunday = UIImage(named: "day.png")
    
    var mondayButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    var imageMonday = UIImage(named: "day.png")
    
    var tuesdayButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    var imageTuesday = UIImage(named: "day.png")
    
    var wednesdayButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    var imageWednesday = UIImage(named: "day.png")
    
    var thursdayButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    var imageThursday = UIImage(named: "day.png")
    
    var fridayButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    var imageFriday = UIImage(named: "day.png")
    
    var saturdayButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    var imageSaturday = UIImage(named: "day.png")
    
    @IBOutlet var viewExerciseTableView: UITableView!
    
    var moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var fetchedResultsController: NSFetchedResultsController?

    // FUNCTIONS
    
    func sundayButtonTouch(sender: UIButton!) {
        println("future event will be added, button working fine - sunday")
    }
    
    func mondayButtonTouch(sender: UIButton!) {
        println("future event will be added, button working fine - monday")
    }
    
    func tuesdayButtonTouch(sender: UIButton!) {
        println("future event will be added, button working fine - tuesday")
    }
    
    func wednesdayButtonTouch(sender: UIButton!) {
        println("future event will be added, button working fine - wednesday")
    }
    
    func thursdayButtonTouch(sender: UIButton!) {
        println("future event will be added, button working fine - thursday")
    }
    
    func fridayButtonTouch(sender: UIButton!) {
        println("future event will be added, button working fine - friday")
    }
    
    func saturdayButtonTouch(sender: UIButton!) {
        println("future event will be added, button working fine - saturday")
    }
    
    // FETCH REQUEST METHODS
    
    
    func fetchTrainingDay() -> NSFetchRequest {
        let fetchRequest  = NSFetchRequest(entityName: "TrainingDay")
        fetchRequest.predicate = nil

        let sortDescriptor = NSSortDescriptor(key: "day", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchRequest.fetchBatchSize = 20
        return fetchRequest
    }
    
    func fetchTrainingDetails() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "TrainingDetails")
        fetchRequest.predicate = nil
        let sortDescriptor1 = NSSortDescriptor(key: "exerciseName", ascending: true)
        let sortDescriptor2 = NSSortDescriptor(key: "repsNumber", ascending: true)
        let sortDescriptor3 = NSSortDescriptor(key: "setsNumber", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor1, sortDescriptor2, sortDescriptor3]
        fetchRequest.fetchBatchSize = 20
        return fetchRequest
    }

    //TABLE VIEW DELEGATE METHODS
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController?.sections?[section].numberOfObjects ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "exCell"
        var cell  = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        if let exCell = fetchedResultsController?.objectAtIndexPath(indexPath) as? TrainingDetails {
            cell!.textLabel?.text = exCell.exerciseName
            cell?.detailTextLabel?.text = "Sets: #\(exCell.setsNumber) Reps: #\(exCell.repsNumber)"
        }
        return cell!
    }
    
    // MARK: NSFetchedResultsControllerDelegate
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.viewExerciseTableView.beginUpdates()
    }
    func controller(controller: NSFetchedResultsController,
        didChangeObject anObject: AnyObject,
        atIndexPath indexPath: NSIndexPath?,
        forChangeType type: NSFetchedResultsChangeType,
        newIndexPath: NSIndexPath?)
    {
        switch(type) {
        case .Insert:
            if let newIndexPath = newIndexPath {
                viewExerciseTableView.insertRowsAtIndexPaths([newIndexPath],
                    withRowAnimation:UITableViewRowAnimation.Fade)
            }
        case .Delete:
            if let indexPath = indexPath {
                viewExerciseTableView.deleteRowsAtIndexPaths([indexPath],
                    withRowAnimation: UITableViewRowAnimation.Fade)
            }
        case .Update:
            break
        case .Move:
            if let indexPath = indexPath {
                if let newIndexPath = newIndexPath {
                    viewExerciseTableView.deleteRowsAtIndexPaths([indexPath],
                        withRowAnimation: UITableViewRowAnimation.Fade)
                    viewExerciseTableView.insertRowsAtIndexPaths([newIndexPath],
                        withRowAnimation: UITableViewRowAnimation.Fade)
                }
            }
        }
    }
    
    func controller(controller: NSFetchedResultsController,
        didChangeSection sectionInfo: NSFetchedResultsSectionInfo,
        atIndex sectionIndex: Int,
        forChangeType type: NSFetchedResultsChangeType)
    {
        switch(type) {
        case .Insert:
            viewExerciseTableView.insertSections(NSIndexSet(index: sectionIndex),
                withRowAnimation: UITableViewRowAnimation.Fade)
        case .Delete:
            viewExerciseTableView.deleteSections(NSIndexSet(index: sectionIndex),
                withRowAnimation: UITableViewRowAnimation.Fade)
        default:
            break
        }
    }
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        viewExerciseTableView.endUpdates()
    }
}
