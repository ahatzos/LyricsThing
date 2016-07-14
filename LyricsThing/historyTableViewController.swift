//
//  historyTableViewController.swift
//  LyricsThing
//
//  Created by iD Student on 7/12/16.
//  Copyright © 2016 iD Student. All rights reserved.
//

import UIKit

class historyTableViewController: UITableViewController {

    @IBOutlet weak var cell: UITableViewCell!
    
    var saver = [" "," "," "," "," "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


   

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return saver.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel!.text = saver[indexPath.row]
        return cell
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        <#code#>
//    }
//
}

    