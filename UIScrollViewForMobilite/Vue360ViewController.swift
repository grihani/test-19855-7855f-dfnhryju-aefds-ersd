//
//  Vue360ViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 02/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit
import MapKit

class Vue360ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UITextViewDelegate {

    @IBOutlet weak var nameCompany: UITextField!
    @IBOutlet weak var shortNameCompany: UITextField!
    @IBOutlet weak var industryCompany: UITextField!
    @IBOutlet weak var phoneCompany: UITextField!
    @IBOutlet weak var mailCompany: UITextField!
    @IBOutlet weak var webSite: UITextField!
    @IBOutlet weak var adressCompany: UITextView!
    @IBOutlet weak var mapAdressCompany: MKMapView!
    
    var account: AccountModel!
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            
            geolocalise(address: account.adressAccount, account: account, mapView: self.mapAdressCompany)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func geolocalise (#address: String?, account: AccountModel, mapView: MKMapView){
//        var address = address
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
                    
                    var options = MKMapSnapshotOptions()
                    options.region = mapView.region
                    options.size = mapView.frame.size
                    options.scale = UIScreen.mainScreen().scale
                    let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
                    let docsDir = dirPaths[0] as String
                    var error: NSError?
                    var filePath = docsDir.stringByAppendingPathComponent("Maps/\(account.idAccount)/")
                    if !NSFileManager.defaultManager().fileExistsAtPath(filePath){
                        NSFileManager.defaultManager().createDirectoryAtPath(filePath, withIntermediateDirectories: true, attributes: nil, error: &error)
                    }
                    filePath = filePath.stringByAppendingPathComponent("\(account.adressAccount).png")
                    var snapshotter = MKMapSnapshotter(options: options)
                    snapshotter.startWithCompletionHandler({ (snapshot, error) -> Void in
                        if ((error) != nil) {
                            NSLog("[Error] %@", error);
                            return;
                        }
                        println("I'm trying to save the image here")
                        let image = snapshot.image
                        let data: NSData = UIImagePNGRepresentation(image)
                        if data.writeToFile(filePath, atomically: true){
                            println("l'enregistrement s'est bien passé")
                            println(filePath)
                            
                        }
                    })
                }
            })
            
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println(locations.last)
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        geolocalise(address: textView.text, account: self.account, mapView: self.mapAdressCompany)
    }
    @IBAction func finishedEditCompany(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
