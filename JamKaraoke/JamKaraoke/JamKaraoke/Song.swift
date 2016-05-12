//
//  Song.swift
//  JamKaraoke
//
//  Created by Jamaal Sedayao on 5/12/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import Foundation

class Song {
    
    //func songDict() -> [String:NSURL]{
    
    let songDict: Dictionary<String, NSURL> = [
        "Don't Stop Believin' - Journey" : NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("dontstopbelievinjourney", ofType: "mp3")!),
        "Uptown Funk by Mark Ronson/Bruno Mars" : NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("uptownfunk", ofType: "mp3")!)
    ]

//        return songDict
//    }
}