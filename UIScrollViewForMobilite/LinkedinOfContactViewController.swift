//
//  LinkedinOfContactViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 24/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class LinkedinOfContactViewController: UIViewController, UIWebViewDelegate, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var webViewForContact: UIWebView!
    var loadingIndicator = LoadingIndicator(frame: CGRectMake(25, 130, 270, 100))
    var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var linkedinTextField: UITextField!
    var linkedinProfileContact: String!
    
    var linkedinProfileContactButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.preservesSuperviewLayoutMargins = true
        println("linkedin : \(linkedinProfileContact)")
        let url = NSURL (string: linkedinProfileContact)
        let requestObj = NSURLRequest(URL: url!)
        self.webViewForContact.loadRequest(requestObj)
        self.webViewForContact.delegate = self
        loadingIndicator.hidden = true
        self.webViewForContact.addSubview(loadingIndicator)
        self.webViewForContact.reload()
        linkedinTextField.text = linkedinProfileContact
        linkedinProfileContactButton.setTitle(linkedinProfileContact, forState: .Normal)
        
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
        if let request = webView.request?.URL.absoluteString {
            self.linkedinTextField.text = request
            linkedinProfileContact = request
            linkedinProfileContactButton.setTitle(request, forState: .Normal)
        }
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.loadingIndicator.hide()
    }
    
    @IBAction func saveLinkedinTextField(sender: UIButton) {
        if let presentingViewController = self.presentingViewController?.presenterViewController as? ContactDetailsViewController {
            presentingViewController.linkedinProfileContact = self.linkedinProfileContact
            presentingViewController.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
