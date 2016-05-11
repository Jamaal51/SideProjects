//
//  ViewController.swift
//  Project4
//
//  Created by Jamaal Sedayao on 5/11/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string:"https://hackingwithswift.com")!
        webView.loadRequest(NSURLRequest(URL:url))
        webView.allowsBackForwardNavigationGestures = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

