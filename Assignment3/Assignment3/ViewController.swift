//
//  ViewController.swift
//  Assignment3
//
//  Created by Krzysztof Dziewiszek on 7/8/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gv: GridView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(gv)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btn4(sender: AnyObject) {
        let arr = GridView()//initialization of classes
        let grid = arr.grid
    
        var newGrid = engine()

        _ = newGrid.step2(grid, width: arr.height, height: arr.width)
        //I know there is a problem here because grid is empty but I have no idea what to do to make it work
        print(arr.grid)
        gv.setNeedsDisplay()
    }
    
    

    @IBAction func gridTap(sender: AnyObject) {
        print("tapped")
        //currentState.toggle()

    }
    

}

