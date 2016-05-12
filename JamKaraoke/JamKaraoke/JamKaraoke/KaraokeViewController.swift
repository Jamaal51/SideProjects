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
    
    @IBOutlet weak var cameraView: UIView!

//    let captureSession = AVCaptureSession()
    var captureDevice: AVCaptureDevice?
    var videoLayer = AVCaptureVideoPreviewLayer()
    
    let alert = UIAlertController()
    var songName: String!
    var songPath: NSURL!
    var songPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        //showAlertController()
        startLiveVideo()
        
        
    }
    
    func startLiveVideo(){
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            
            let captureSession = AVCaptureSession()
            captureSession.sessionPreset = AVCaptureSessionPresetHigh

            let devices = AVCaptureDevice.devicesWithMediaType(AVMediaTypeVideo)
            
            for device in devices {
                if(device.position == AVCaptureDevicePosition.Front){
                    captureDevice = device as? AVCaptureDevice
                }
            }
            
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice)
                captureSession.addInput(input)
            } catch {
                print("woops")
            }

            videoLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoLayer.frame = self.view.bounds
            
            cameraView.layer.addSublayer(videoLayer)
            self.view.addSubview(cameraView)
            
            captureSession.startRunning()
            
        }
        
    }
    
    func showAlertController() {
        alert.addAction(UIAlertAction(title: "Ready To Sing?", style: .Default, handler:(playSong)))
        alert.addAction(UIAlertAction(title: "No", style: .Cancel, handler: (backToList)))
        presentViewController(alert, animated: true, completion: nil)
        
    }

    func playSong(alert:UIAlertAction) {
      
        do{
            try songPlayer = AVAudioPlayer(contentsOfURL: songPath)
        } catch {
            print("Woops")
        }
        songPlayer.play()
    }
    
    func backToList(alert:UIAlertAction) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
}

