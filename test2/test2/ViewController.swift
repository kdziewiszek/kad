//
//  ViewController.swift
//  test2
//
//  Created by Krzysztof Dziewiszek on 6/29/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myText: UITextView!
    
    @IBAction func buttonClicked(sender: AnyObject) {
        print("i'm clicked")
        myText.text("hi")
    }
    

}

