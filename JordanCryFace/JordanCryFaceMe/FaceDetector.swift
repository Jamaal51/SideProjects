//
//  FaceDetector.swift
//  JordanCryFaceMe
//
//  Created by Jamaal Sedayao on 5/10/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit
import CoreImage

class FaceDetector: UIView {
    
    var faceRect = CGRect()
    
    func detectFace(withImage inputImage: UIImage!) -> CGRect{
        if inputImage != nil{
            let ciImage = CIImage(CGImage: inputImage.CGImage!)
            
            let options = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
            let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: options)
            
            let faces = faceDetector.featuresInImage(ciImage)
            
            if let face = faces.first as? CIFaceFeature{
                print("Found face at \(face.bounds)")
                faceRect = face.bounds
                
                if face.hasLeftEyePosition {
                    print("Found left eye at \(face.leftEyePosition)")
                }
                
                if face.hasRightEyePosition {
                    print("Found right eye at \(face.rightEyePosition)")
                }
                
                if face.hasMouthPosition {
                    print("Found mouth at \(face.mouthPosition)")
                }
            }
        }
        return faceRect
    }
    
    func replaceFaceWithPNG(insideView view:UIView) {
        
        let pngImage = UIImage(imageLiteral: "mjcryface")
        pngImage.drawInRect(faceRect)
        //view.addSubview(pngImage)
    }
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(roundedRect: faceRect, cornerRadius: 0.0)
        path.lineWidth = 5.0
        UIColor.redColor().set()
        path.stroke()
    }
    

}
