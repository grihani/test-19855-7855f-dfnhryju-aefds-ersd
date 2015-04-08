//
//  Vue360ViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 02/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit
import MapKit

class Vue360ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var nameCompany: UITextField!
    @IBOutlet weak var shortNameCompany: UILabel!
    @IBOutlet weak var leadCompany: UILabel!
    @IBOutlet weak var industryCompany: UILabel!
    @IBOutlet weak var phoneCompany: UILabel!
    @IBOutlet weak var webSiteCompany: UILabel!
    @IBOutlet weak var addressCompany: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var statusCompany: UILabel!
    @IBOutlet weak var vueGauche: UIView!
    @IBOutlet weak var vueDroite: UIView!
    var account: AccountModel!
    var locationManager = CLLocationManager()
    let fileManager = NSFileManager.defaultManager()
    var imageExists = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if account != nil {
            self.nameCompany.text = account.nameAccount
            self.shortNameCompany.text = account.shortNameAccount
            self.industryCompany.text = account.industryAccount
            self.webSiteCompany.text = account.websiteAccount
            self.phoneCompany.text = account.phoneAccount
            
            self.statusCompany.text = account.statusAccount
            self.mapView.delegate = self
            
            // Do any additional setup after loading the view.
            self.locationManager.delegate = self
            self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.startUpdatingLocation()
            
            var address = "8 rue pierre-curie, Asnières sur seine, France"
            var geocoder = CLGeocoder()
            
            geocoder.geocodeAddressString(address, completionHandler: {(placemarks: [AnyObject]!, error: NSError!) -> Void in
                if let placemark = placemarks?[0] as? CLPlacemark {
                    let span = MKCoordinateSpanMake(0.01, 0.01)
                    let region = MKCoordinateRegionMake(placemark.location.coordinate, span)
                    self.mapView.setRegion(region, animated: false)
                    let annotation = MKPointAnnotation()
                    annotation.setCoordinate(placemark.location.coordinate)
                    annotation.title = self.account.nameAccount
                    self.mapView.addAnnotation(annotation)
                }
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        var frame = nameCompany.frame
        var frameDeGauche = vueGauche.frame
        var frameDeDroite = vueDroite.frame
        frameDeGauche.size.width = frame.size.width / 2 - 4
        vueGauche.frame = frameDeGauche
        frameDeDroite.origin.x = frame.origin.x + frame.size.width/2 + 4
        frameDeDroite.size.width = frameDeGauche.size.width
        vueDroite.frame = frameDeDroite
        vueGauche.clipsToBounds = true
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
    func keyboardWillBeHidden(aNotification: NSNotification) {
        println("je vois que le keyboard a disparu")
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
