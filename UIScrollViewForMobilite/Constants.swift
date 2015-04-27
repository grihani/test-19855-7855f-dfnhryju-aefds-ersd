//
//  Constants.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 10/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation
import UIKit

let whiteColor: UIColor = UIColor.whiteColor()
let blueCheckedColor: UIColor = UIColor(red: 143/255, green: 157/255, blue: 255/255, alpha: 1)
let blueUncheckedColor: UIColor = UIColor(red: 155/255, green: 250/255, blue: 255/255, alpha: 1)
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