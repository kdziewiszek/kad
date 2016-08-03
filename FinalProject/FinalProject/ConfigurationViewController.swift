//
//  ConfigurationViewController.swift
//  ProjectPrototype
//
//  Created by Van Simmons on 7/23/16.
//  Copyright © 2016 S65g. All rights reserved.
//

import UIKit

class ConfigurationViewController: UITableViewController {

    private var configs: [String] = []
    var gridview = GridView()
    var pnts: [(Int,Int)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchOGConfigs()
        let n = NSNotificationCenter.defaultCenter()
        n.addObserver(self, selector: #selector(tableNotification), name: "TableNotification", object: nil)
        // Do any additional setup after loading the view.
    }
    @IBAction func addBtn(sender: AnyObject) {
        configs.append("Add new config...")
        let itemRow = configs.count - 1
        let itemPath = NSIndexPath(forRow:itemRow, inSection: 0)
        tableView.insertRowsAtIndexPaths([itemPath], withRowAnimation: .Automatic)
    }
    
    func tableNotification(notification:NSNotification?){
        configs.append("Add new config...")
        let itemRow = configs.count - 1
        let itemPath = NSIndexPath(forRow:itemRow, inSection:0)
        tableView.insertRowsAtIndexPaths([itemPath], withRowAnimation: .Automatic)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return configs.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("Default")
            else {
                preconditionFailure("missing Default reuse identifier")
        }
        let row = indexPath.row
        guard let nameLabel = cell.textLabel else {
            preconditionFailure("wtf?")
        }
        nameLabel.text = configs[row]
        cell.tag = row
        return cell
    }
    
    func fetchOGConfigs() {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/u/7544475/S65g.json")!
        let fetcher = Fetcher()
        fetcher.requestJSON(url) { (json, message) in
            let op = NSBlockOperation {
                print(message)
                if let jArray = json as? [[String: AnyObject]]{
                    for j in jArray{
                        var pnt: (Int,Int)
                        if let title = j["title"] as? String{
                            self.configs.append(title)
                            self.tableView.reloadData()
                            if let contents = j["contents"] as? NSArray{
                                for c in contents{
                                    if let x = c[0] as? Int{

                                    if let y = c[1] as? Int{
                                    
                                    
                                    pnt = (x,y)
                                    self.pnts.append(pnt)
                                        }
                                    }
                                }
                                
                                //self.gridview.points = self.pnts
                                //print(self.gridview.points)
                                // notify edit view
                                
                            }
                            //self.gridview.points.removeAll()
                        }
                        
                    }
                }
                }
            NSOperationQueue.mainQueue().addOperation(op)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let editingRow = (sender as! UITableViewCell).tag
        let editingString = configs[editingRow]
        guard let editingVC = segue.destinationViewController as? ConfigurationEditorViewController
            else{
                preconditionFailure("Something bad happened")
        }
        editingVC.name = editingString
        editingVC.commit = {
            self.configs[editingRow] = $0
            let indexPath = NSIndexPath(forRow: editingRow, inSection: 0)
            self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
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
