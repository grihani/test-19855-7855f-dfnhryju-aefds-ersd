//
//  Constants.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 10/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation
import UIKit
    // Hexa: 84a3cd for blueCheckedColor
    // Hexa: 2f9372 for greenMenuButtons
let whiteColor: UIColor = UIColor.whiteColor()

let blueCheckedColor: UIColor = UIColor(red: 132/255, green: 163/255, blue: 205/255, alpha: 1)

let blueUncheckedColor: UIColor = UIColor(red: 221/255, green: 231/255, blue: 243/255, alpha: 1)

let blackColor: UIColor = UIColor.blackColor()

let blueButtonColor: UIColor = UIColor(red: 58/255, green: 144/255, blue: 219/255, alpha: 1)


extension UIViewController {
    var presenterViewController: UIViewController {
        if let swRevealController = self as? SWRevealViewController {
            if let navCon = swRevealController.frontViewController as? UINavigationController {
                return navCon.topViewController
            }
            else {
                return swRevealController.frontViewController
            }
        } else {
            if let navCon = self as? UINavigationController {
                return navCon.topViewController
            }
            else {
                return self
            }
        }
    }
    
    var contentViewController: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.topViewController
        } else {
            return self
        }
    }
}