//
//  historyTableViewController.swift
//  LyricsThing
//
//  Created by iD Student on 7/12/16.
//  Copyright © 2016 iD Student. All rights reserved.
//

import UIKit

class historyTableViewController: UITableViewController {

    
    @IBOutlet var historyTableView: UITableView!
    @IBOutlet weak var cell: UITableViewCell!
    var allSongs = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allSongs = NSUserDefaults.standardUserDefaults().valueForKey("savedSongs") as! Array< Dictionary<String, String> >
        self.historyTableView.reloadData()
    }


   

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allSongs.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let dictionary = self.allSongs[indexPath.row] as! Dictionary<String, String>
        cell.textLabel!.text = dictionary["name"]
        return cell
    }
    
    @IBAction func trash(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setValue([], forKey: "savedSongs")
        allSongs = []
        self.historyTableView.reloadData()
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("lyircsSegway", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! lyircsSegwayTableViewController
        let dictionary = self.allSongs[self.historyTableView.indexPathForSelectedRow!.row] as! Dictionary<String, String>
        vc.data = dictionary
    }

}

    