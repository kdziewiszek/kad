//
//  SecondViewController.swift
//  Assignment4
//
//  Created by Krzysztof Dziewiszek on 7/14/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import UIKit

class SimulationViewController: UIViewController {

    

    @IBOutlet weak var gv: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(gv)
        SimulationViewController.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    
    
}

    @IBAction func myBtn(sender: AnyObject) {
        let arr = GridView()//initialization of classes
        var grid = arr.grid
        grid = grid.step()
        func EngineNotification() {
            gv.setNeedsDisplay()
        }
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

