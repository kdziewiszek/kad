//
//  ConfigurationEditorViewController.swift
//  ProjectPrototype
//
//  Created by Van Simmons on 7/23/16.
//  Copyright © 2016 S65g. All rights reserved.
//

import UIKit

class ConfigurationEditorViewController: UIViewController {
    
    var name:String?
    var commit: (String -> Void)?
    
    @IBOutlet weak var nameconfig: UITextField!
    
    @IBOutlet weak var grid: GridView!
    @IBAction func saveConfig(sender: AnyObject) {
        guard let newText = nameconfig.text, commit = commit
            else { return }
        commit(newText)
        navigationController!.popViewControllerAnimated(true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameconfig.text = name
         NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(redrawGridNotification), name: "redrawGridNotification", object: nil)
        // Do any additional setup after loading the view.
    }
    func redrawGridNotification(notification:NSNotification?){
       grid.setNeedsDisplay()
        
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
