//
//  ViewController.swift
//  JordanCryFaceMe
//
//  Created by Jamaal Sedayao on 5/10/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit
import Foundation

class CryFaceViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var location = CGPoint(x: 0, y: 0)
    var dragStartPositionRelativeToCenter : CGPoint?
    
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    let detector = FaceDetector()
    var currentImage = UIImage?()
    var jordanImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
    }

    @IBAction func selectTapped(sender: UIButton) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        currentImage = image
        imageView.image = currentImage!
        imageView.contentMode = .ScaleAspectFit
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func faceDetectTapped(sender: UIButton) {
        if currentImage != nil {
        let faceRect = detector.detectFace(withImage: currentImage)
        print("Face Rect: \(faceRect)")
        let imageName = "mjcryface"
        let pngImage = UIImage(named: imageName)
        
        let newView = UIView(frame:faceRect)
        //newView.backgroundColor = UIColor.blueColor()
        
        jordanImageView = UIImageView(image:pngImage)
        jordanImageView.contentMode = .ScaleAspectFit
        //jordanImageView.image = pngImage!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        jordanImageView.tintColor = UIColor.clearColor()
        //jordanImageView.alpha = 0.1
        
        jordanImageView.userInteractionEnabled = true
            
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
            
        jordanImageView.addGestureRecognizer(gesture)
        
        //print("new view bounds 1:\(newView.bounds)")
        //print("new image:\(pngImage)")
        
        jordanImageView.frame = CGRectMake(0,0,faceRect.width,faceRect.height)
            
        //newImageView.bounds = thisFrame
    
        self.view.addSubview(newView)
            
        self.view.addSubview(jordanImageView)
            
        print("new view bounds 2:\(newView.bounds)")
        }
        
    }
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        if let touch = touches.first {
//            // ...
//        }
//        super.touchesBegan(touches, withEvent:event)
//    }
    
    func handlePan(nizer: UIPanGestureRecognizer!) {
    
        let translation = nizer.translationInView(self.view)
        
        nizer.view!.center = CGPoint(x: nizer.view!.center.x + translation.x, y: nizer.view!.center.y + translation.y)
        
        nizer.setTranslation(CGPointZero, inView: self.view)

    
    }
}

