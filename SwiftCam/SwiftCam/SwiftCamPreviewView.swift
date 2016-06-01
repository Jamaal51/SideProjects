//
//  SwiftCamPreviewView.swift
//  SwiftCam
//
//  Created by Jamaal Sedayao on 5/18/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit
import AVFoundation

class SwiftCamPreviewView: UIView {

    var session: AVCaptureSession?
    
    private func setSession(session:AVCaptureSession){
        
        let previewLayer = AVCaptureVideoPreviewLayer()
        
        previewLayer.session = session
        
    }

}
