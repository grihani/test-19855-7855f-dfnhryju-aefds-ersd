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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func finishedEditCompany(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
