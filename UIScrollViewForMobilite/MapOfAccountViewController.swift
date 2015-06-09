//
//  MapOfAccountViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 13/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit
import MapKit

class MapOfAccountViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapViewForCompany: MKMapView! {
        didSet {
            if let account = account {
                geolocalise(account: account, mapView: mapViewForCompany)
            }
        }
    }
    var account: AccountModel! {
        didSet {
            if mapViewForCompany != nil {
                geolocalise(account: account, mapView: mapViewForCompany)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func geolocalise (#account: AccountModel, mapView: MKMapView){
        
        var geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(account.adressAccount, completionHandler: {(placemarks: [AnyObject]!, error: NSError!) -> Void in
            if let placemark = placemarks?[0] as? CLPlacemark {
                let span = MKCoordinateSpanMake(0.01, 0.01)
                let region = MKCoordinateRegionMake(placemark.location.coordinate, span)
                mapView.setRegion(region, animated: false)
                let annotation = MKPointAnnotation()
                
                annotation.coordinate = placemark.location.coordinate
                annotation.title = account.nameAccount
                annotation.subtitle = account.phoneAccount
                mapView.addAnnotation(annotation)
                mapView.selectAnnotation(annotation, animated: true)
            }
        })
    }
    
    @IBAction func closeMap(sender: UIBarButtonItem) {
        self.presentingViewController?.contentViewController.presenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
