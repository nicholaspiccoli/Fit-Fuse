//
//  StarWorkoutViewController.swift
//  Fit Fuse
//
//  Created by Nicholas Piccoli on 11/08/15.
//  Copyright (c) 2015 Nicholas Piccoli. All rights reserved.
//

import UIKit

class StartWorkoutViewController: UIViewController {

    @IBOutlet var logoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var logo = UIImage(named: "hulk.jpg")
        logoImageView.image = logo
    }
    
    @IBAction func startWorkoutButton(sender: AnyObject) {
    }
}