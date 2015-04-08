//
//  Vue360ViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 02/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit
import MapKit

class Vue360ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var nameCompany: UITextField!
    @IBOutlet weak var shortNameCompany: UITextField!
    @IBOutlet weak var industryCompany: UITextField!
    @IBOutlet weak var phoneCompany: UITextField!
    @IBOutlet weak var mailCompany: UITextField!
    @IBOutlet weak var webSite: UITextField!
    @IBOutlet weak var adressCompany: UITextView!
    @IBOutlet weak var mapAdressCompany: MKMapView!
    @IBOutlet weak var leftView: UIView!
    
    var activeField: AnyObject!
    var account: AccountModel!
    var locationManager = CLLocationManager()
    let fileManager = NSFileManager.defaultManager()
    var imageExists = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameCompany.delegate = self
        self.shortNameCompany.delegate = self
        self.industryCompany.delegate = self
        self.phoneCompany.delegate = self
        self.mailCompany.delegate = self
        self.webSite.delegate = self
        registerForKeyboardNotifications()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.adressCompany.delegate = self
        self.mapAdressCompany.delegate = self
        self.locationManager.startUpdatingLocation()
        if account != nil {
            self.nameCompany.text = account.nameAccount
            self.shortNameCompany.text = account.shortNameAccount
            self.industryCompany.text = account.industryAccount
            self.phoneCompany.text = account.phoneAccount
            self.webSite.text = account.websiteAccount
            self.adressCompany.text = account.adressAccount
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func geolocaliseAvecImage(#address: String?, account: AccountModel, mapView: MKMapView) {
        if let address = address {
            // if the image exists put the image in place of the mapView
            // else create the mapView then show the image in its place
            if checkImageExist(address: address, account: account) {
                var frame = mapView.frame
                self.imageExists = true
                mapView.removeFromSuperview()
                self.mapAdressCompany = nil
                var pathImage = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
                pathImage = pathImage.stringByAppendingPathComponent("Maps/\(account.idAccount)/\(account.adressAccount).png")
                var image = UIImageView(image: UIImage(contentsOfFile: pathImage))
                image.frame = frame
                self.leftView.addSubview(image)
            } else {
                var geocoder = CLGeocoder()
                geocoder.geocodeAddressString(address, completionHandler: {(placemarks: [AnyObject]!, error: NSError!) -> Void in
                    if let placemark = placemarks?[0] as? CLPlacemark {
                        if placemark.location != nil {
                            self.imageExists = false
                            let span = MKCoordinateSpanMake(0.01, 0.01)
                            let region = MKCoordinateRegionMake(placemark.location.coordinate, span)
                            mapView.setRegion(region, animated: false)
                            let annotation = MKPointAnnotation()
                            print("les coordonnées sont : ")
                            print(placemark.location.coordinate.latitude)
                            print(", ")
                            println(placemark.location.coordinate.longitude)
                            annotation.setCoordinate(placemark.location.coordinate)
                            annotation.title = account.nameAccount
                            mapView.addAnnotation(annotation)
                            mapView.selectAnnotation(annotation, animated: true)
                        } else {
                            println("the adress is not correct")
                            mapView.removeFromSuperview()
                        }
                    }
                })
            }
        }
    }
    
    // check if there's an image in the repertory for the mapview
    func checkImageExist(#address: String, account: AccountModel) -> Bool{
        var error: NSError?
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        var dirPath = paths.stringByAppendingPathComponent("Maps/\(account.idAccount)/")
        if !fileManager.fileExistsAtPath(dirPath){
            fileManager.createDirectoryAtPath(dirPath, withIntermediateDirectories: true, attributes: nil, error: &error)
            return false
        } else {
            var filePath = dirPath.stringByAppendingPathComponent("\(account.adressAccount).png")
            if !fileManager.fileExistsAtPath(filePath){
                // deleting all files in the directory
                var i = 0
                var directoryFiles = fileManager.contentsOfDirectoryAtPath(dirPath, error: &error)
                if let directoryFiles = directoryFiles {
                    for file in directoryFiles {
                        i++
                        print("suppression \(i): ")
                        let success = fileManager.removeItemAtPath("\(dirPath)/\(file)", error: &error)
                        if (!success || error != nil) {
                            println(error)
                        }
                    }
                }
                return false
            }
        }
        return true
    }
    
    // that's just to geolocalise an adress without creating an image
    func geolocalise (#address: String?, account: AccountModel, mapView: MKMapView){
        if address != nil {
            var geocoder = CLGeocoder()
        
            geocoder.geocodeAddressString(address, completionHandler: {(placemarks: [AnyObject]!, error: NSError!) -> Void in
                if let placemark = placemarks?[0] as? CLPlacemark {
                    let span = MKCoordinateSpanMake(0.01, 0.01)
                    let region = MKCoordinateRegionMake(placemark.location.coordinate, span)
                    mapView.setRegion(region, animated: false)
                    let annotation = MKPointAnnotation()
                    print("les coordonnées sont : ")
                    print(placemark.location.coordinate.latitude)
                    print(", ")
                    println(placemark.location.coordinate.longitude)
                    annotation.setCoordinate(placemark.location.coordinate)
                    annotation.title = account.nameAccount
                    annotation.subtitle = account.phoneAccount
                    mapView.addAnnotation(annotation)
                    mapView.selectAnnotation(annotation, animated: true)
                }
            })
            
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println(locations.last)
    }
    
    // rendering a picture for the mapview
    func pictureForView(view: UIView) -> UIImage {
        UIGraphicsBeginImageContext(view.frame.size)
        var ctx: CGContextRef = UIGraphicsGetCurrentContext()
        view.layer.renderInContext(ctx)
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    // it will check if there's an image here so that we put it up
    func mapViewWillStartRenderingMap(mapView: MKMapView!) {
        if account != nil {
            geolocaliseAvecImage(address: account.adressAccount, account: account, mapView: self.mapAdressCompany)
        }
    }
    
    func mapViewDidFinishRenderingMap(mapView: MKMapView!, fullyRendered: Bool) {
        if account != nil && !self.imageExists {
            var frame = mapView.frame
            var mapImage: UIImage = self.pictureForView(mapView)
            var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
            var dirPath = paths.stringByAppendingPathComponent("Maps/\(account.idAccount)/")
            var imagePath = dirPath.stringByAppendingPathComponent("\(account.adressAccount).png")
            if !fileManager.fileExistsAtPath(imagePath) {
//                fileManager.createDirectoryAtPath(dirPath, withIntermediateDirectories: true, attributes: nil, error: nil)
                UIImagePNGRepresentation(mapImage).writeToFile(imagePath, atomically: true)
                
            }
            mapView.removeFromSuperview()
            var image = UIImageView(image: UIImage(contentsOfFile: imagePath))
            image.frame = frame
            self.leftView.addSubview(image)
            
            println(imagePath)
        }
        println("finished rendering map")
    }
    
    @IBAction func finishedEditCompany(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func registerForKeyboardNotifications() {
        let center = NSNotificationCenter.defaultCenter()
        let queue = NSOperationQueue.mainQueue()
//        center.addObserverForName(UIKeyboardDidShowNotification, object: self.adressCompany, queue: queue) { notification in
//            var frame = self.adressCompany.frame
//            var info = notification.userInfo
//            var kbSize = info.
//            println("je vois que le keyboard a apparu")
//        }
        center.addObserver(self,
            selector: Selector("keyBoardWasShown:"),
            name: UIKeyboardDidShowNotification,
            object: nil
        )
//        NSNotificationCenter.defaultCenter().addObserver(self,
//            selector: Selector("keyboardWillBeHidden:"),
//            name: "UIKeyboardWillHideNotification",
//            object: nil
//        )
        
    }
    
    func keyBoardWasShown(aNotification: NSNotification) {
        println("je vois que le keyboard est apparu")
//        if let info: NSDictionary = aNotification.userInfo {
//            if let kbSize = info.objectForKey(UIKeyboardFrameBeginUserInfoKey)?.CGRectValue().size {
//                println(kbSize)
//                let contentInset = UIEdgeInsetsMake(0, 0, kbSize.height, 0)
//                let scrollView = self.view.superview as UIScrollView
//                scrollView.contentInset = contentInset
//                scrollView.scrollIndicatorInsets = contentInset
//                
//                var aRect = self.view.superview?.superview?.frame
//                if let aRect = aRect {
//                    
//                    var rectToCheck = aRect
//                    rectToCheck.size.height -= kbSize.height
//                    let frameActiveField = activeField.convertRect(activeField.frame, toView: scrollView.superview)
//                    println(frameActiveField)
//                    println(rectToCheck)
//                    if !CGRectContainsPoint(rectToCheck, frameActiveField.origin) {
//                        println("trying to put the field up")
//                        scrollView.scrollRectToVisible(activeField.frame, animated: true)
//                    }
//                }
//            }
//        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.activeField = textField
        
    }
    func textFieldDidEndEditing(textField: UITextField) {
        self.activeField = nil
    }
    func textViewDidBeginEditing(textView: UITextView) {
        self.activeField = textView
    }
    func textViewDidEndEditing(textView: UITextView) {
        self.activeField = nil
        //        geolocalise(address: textView.text, account: self.account, mapView: self.mapAdressCompany)
    }
}
