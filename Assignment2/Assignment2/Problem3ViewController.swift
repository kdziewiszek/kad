//
//  Problem3ViewController.swift
//  Assignment2
//
//  Created by Krzysztof Dziewiszek on 7/2/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import UIKit

class Problem3ViewController: UIViewController {

    @IBOutlet weak var txt3: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Problem 3"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn3(sender: AnyObject)
    {
        let newmy2D = prob3(height: 10, width: 10)
        let b = newmy2D.step(newmy2D.twoDimArrayOfInt)
        
        if let n = newmy2D.countLive(b){
            txt3.text = String(n)
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
