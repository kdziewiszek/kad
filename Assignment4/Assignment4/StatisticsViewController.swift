//
//  StatisticsViewController.swift
//  Assignment4
//
//  Created by Krzysztof Dziewiszek on 7/17/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet weak var numLiving: UILabel!
    @IBOutlet weak var numEmpty: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "actOnSpecialNotification", name: "EngineNotification", object: nil)
    }
}
