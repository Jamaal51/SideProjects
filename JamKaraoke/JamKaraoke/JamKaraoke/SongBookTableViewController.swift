//
//  SongBookTableViewController.swift
//  JamKaraoke
//
//  Created by Jamaal Sedayao on 5/12/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit

class SongBookTableViewController: UITableViewController {
    
    let songs = Song().songDict
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        title = "Songs!"
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("songListID", forIndexPath: indexPath)

        let songName = Array(songs.keys)[indexPath.row]
        
        cell.textLabel?.text = songName

        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     
        if (segue.identifier == "segueToKaraokeVC"){
            let vc = segue.destinationViewController as! KaraokeViewController
            
            if let indexPath = tableView.indexPathForSelectedRow{
                let songName = Array(songs.keys)[indexPath.row]
                let songPath = Array(songs.values)[indexPath.row]
                vc.songName = songName
                vc.songPath = songPath
            }
            
        }
    }


}
