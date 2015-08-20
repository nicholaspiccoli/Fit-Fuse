//
//  ViewController.swift
//  Fit Fuse
//
//  Created by Nicholas Piccoli on 10/08/15.
//  Copyright (c) 2015 Nicholas Piccoli. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var logo = UIImage(named: "no_pain_no_gain-_.jpg")
        logoImage.image = logo
        
        viewExercisesButton.frame = CGRectMake(-30,250,125,125)
        viewExercisesButton.addTarget(self, action: "viewExercisesButtonTouch:", forControlEvents: UIControlEvents.TouchDown)
        viewExercisesButton.setImage(imageViewExercises, forState: .Normal)
        viewExercisesButton.imageEdgeInsets = UIEdgeInsetsMake(30,30,30,30)
        self.view.addSubview(viewExercisesButton)
    }

    var moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var fetchedResultsController: NSFetchedResultsController?
    
    @IBOutlet var logoImage: UIImageView!
        
    var viewExercisesButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    var imageViewExercises = UIImage(named: "plusbutton.png")
    
    
    func viewExercisesButtonTouch(sender: UIButton!) {
              performSegueWithIdentifier("goToDays", sender: self)
        println("future event will be added, button working fine - view")
    }
}