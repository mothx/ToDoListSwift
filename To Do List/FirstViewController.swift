//
//  FirstViewController.swift
//  To Do List
//
//  Created by Felix Bengtsson on 26/10/14.
//  Copyright (c) 2014 Felix Bengtsson. All rights reserved.
//

import UIKit

var toDoItems:[String] = []

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tasksTable:UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default , reuseIdentifier:  "Cell")
        
       cell.textLabel?.text = toDoItems[indexPath.row]
        
        return cell
        
    }

    override func viewWillAppear(animated: Bool) {
        if var storedToDoItems : AnyObject! = NSUserDefaults.standardUserDefaults().objectForKey("toDoItems") {
            
            toDoItems = []
            
           
            for var i = 0; i < storedToDoItems.count; ++i{
                var stringStored = storedToDoItems as Array <String!>
                toDoItems.append(stringStored[i] as NSString)
                
                //Continue at 32:20 at udemy lesson 482
            }
            
        }
        
        tasksTable.reloadData()
        
    }


}

