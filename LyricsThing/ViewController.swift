//
//  ViewController.swift
//  LyricsThing
//
//  Created by iD Student on 7/12/16.
//  Copyright © 2016 iD Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, NSXMLParserDelegate {
    
    //TODO: The lyrics from the "lyrics" should go to the cells of the History tab by pressing the + button. But the name of the cell (of each thingy of the array) would be the name of the song from the songLabel textfield.
    
    var holder = [String]()

    @IBOutlet weak var artistLabel: UITextField!
    
    
    @IBOutlet weak var songLabel: UITextField!
    
    @IBAction func Plus(sender: UIBarButtonItem) {
        var i = 0
        holder.append(songLabel.text!)
        i+=1
    }

 
    @IBOutlet weak var lyricsField: UITextView!
    
    
    @IBAction func History(sender: UIButton) {
        
    }
    
    let urlBase = "http://api.chartlyrics.com/apiv1.asmx/SearchLyricDirect?artist="
    let songUrl = "&song="
    var foundLyric = false
    var lyrics = "Lyrics not found"
    
    override func viewDidLoad() {
        super.viewDidLoad()
      artistLabel.delegate = self
      songLabel.delegate = self
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        

        
        var urlString = urlBase + artistLabel.text! + songUrl + songLabel.text!
        urlString = urlString.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        let url = NSURL(string: urlString)
        
    
        // TODO: Prevent nil values in URL
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data, response, error) in
            
        let parser = NSXMLParser(data: data!)
            parser.delegate = self
            parser.parse()
        }
        
        task.resume()
        textField.resignFirstResponder()

    
        return true
     
    }
   
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if(elementName == "Lyric"){
            foundLyric = true
        }
//        print(elementName)
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        print(elementName)
    }
    
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
//        print("--------------------------------------------------------------------")

        
        
        if foundLyric == true{
            lyrics = string
    
        }
//          print(lyrics)
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
//            print("TESTSKDHSbdhdshufgdfisufjkdsfnijdsiufhdsiu")
//            print("test")
            self.lyricsField.text = self.lyrics
            print(self.lyrics)
        }

    }
  
}


