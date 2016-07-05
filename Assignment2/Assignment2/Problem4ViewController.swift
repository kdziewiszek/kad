//
//  Problem4ViewController.swift
//  Assignment2
//
//  Created by Krzysztof Dziewiszek on 7/2/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import UIKit

class Problem4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Problem 4"
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var txt4: UITextView!
    @IBAction func btn4(sender: AnyObject) {
        let newmy2D4 = prob4(height: 5, width: 5)
        let b = newmy2D4.step2(newmy2D4.twoDimArrayOfInt)
        
        if let n = newmy2D4.countLive(b){
            txt4.text = String(n)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
