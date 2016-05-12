//
//  KaraokeViewController.swift
//  JamKaraoke
//
//  Created by Jamaal Sedayao on 5/12/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit
import AVFoundation

class KaraokeViewController: UIViewController {
    
    let alert = UIAlertController()
    var songName: String!
    var songPath: NSURL!

    override func viewDidLoad() {
        super.viewDidLoad()
       showAlertController()
    }
    
    func showAlertController() {
        alert.addAction(UIAlertAction(title: "Ready To Sing?", style: .Default, handler:(playSong)))
        alert.addAction(UIAlertAction(title: "No", style: .Cancel, handler: (backToList)))
        presentViewController(alert, animated: true, completion: nil)
        
    }

    func playSong(alert:UIAlertAction) {
        
      print("Called")
        
    }
    
    func backToList(alert:UIAlertAction) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
}

