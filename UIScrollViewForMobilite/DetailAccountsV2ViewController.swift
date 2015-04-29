//
//  DetailAccountsV2ViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 28/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class DetailAccountsV2ViewController: UIViewController, UIScrollViewDelegate {

    var account: AccountModel! {
        didSet {
            
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func registerForKeyboardNotifications() {
        let center = NSNotificationCenter.defaultCenter()
        let queue = NSOperationQueue.mainQueue()
        center.addObserver(self,
            selector: Selector("keyBoardWasShown:"),
            name: UIKeyboardDidShowNotification,
            object: nil
        )
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: Selector("keyboardWillBeHidden:"),
            name: UIKeyboardWillHideNotification,
            object: nil
        )
        
    }
    func keyBoardWasShown(aNotification: NSNotification) {
        println("je vois que le keyboard est apparu")
        if let info: NSDictionary = aNotification.userInfo {
            if let kbSize = info.objectForKey(UIKeyboardFrameBeginUserInfoKey)?.CGRectValue().size {
                println(kbSize)
                let contentInset = UIEdgeInsetsMake(0, 0, kbSize.height, 0)
                let scrollView = self.scrollView
                println(scrollView.contentInset)
                scrollView.contentInset = contentInset
                println(scrollView.contentInset)
                scrollView.scrollIndicatorInsets = contentInset
        
//                        var aRect = self.view.superview?.superview?.frame
//                        if let aRect = aRect {
//        
//                            var rectToCheck = aRect
//                            rectToCheck.size.height -= kbSize.height
//                            let frameActiveField = activeField.convertRect(activeField.frame, toView: scrollView.superview)
//                            println(frameActiveField)
//                            println(rectToCheck)
//                            if !CGRectContainsPoint(rectToCheck, frameActiveField.origin) {
//                                println("trying to put the field up")
//                                scrollView.scrollRectToVisible(activeField.frame, animated: true)
//                            }
//                        }
            }
        }
    }
    func keyboardWillBeHidden(aNotification: NSNotification) {
        println("le keyboard a disparu")
        let contentInsets = UIEdgeInsetsZero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
}
