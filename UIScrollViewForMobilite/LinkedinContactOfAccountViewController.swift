//
//  LinkedinContactOfAccountViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 16/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class LinkedinContactOfAccountViewController: UIViewController, UIWebViewDelegate {

    var linkedinAccount = ""
    @IBOutlet weak var linkedinWebView: UIWebView!
    var loadingIndicator = LoadingIndicator(frame: CGRectMake(25, 130, 270, 100))
    var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let url = NSURL (string: linkedinAccount)
        let url = NSURL (string: linkedinAccount)
        var requestObj: NSURLRequest = NSURLRequest()
        if url != nil {
            requestObj = NSURLRequest(URL: url!)
        } else {
            requestObj = NSURLRequest(URL: NSURL(string: "https://fr.linkedin.com/")!)
        }
        self.linkedinWebView.loadRequest(requestObj)
        self.linkedinWebView.delegate = self
        loadingIndicator.hidden = true
        self.linkedinWebView.addSubview(loadingIndicator)
        self.linkedinWebView.reload()
        println(linkedinAccount)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.loadingIndicator.show("Loading")
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.loadingIndicator.hide()
    }
    //linkedingContactOfAccount
}
