//
//  lyircsSegwayTableViewController.swift
//  LyricsThing
//
//  Created by iD Student on 7/15/16.
//  Copyright © 2016 iD Student. All rights reserved.
//

import UIKit

class lyircsSegwayTableViewController: UIViewController {

    @IBOutlet weak var lyricss: UITextView!
    
    var data = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = data["name"]
        self.lyricss.text = data["lyrics"]
    }

 


}
