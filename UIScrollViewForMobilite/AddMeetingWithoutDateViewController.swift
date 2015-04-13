//
//  AddMeetingWithoutDateViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 13/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit
import MapKit

class AddMeetingWithoutDateViewController: UIViewController, MKMapViewDelegate, UITextViewDelegate, CLLocationManagerDelegate  {

    @IBOutlet weak var dateEndMeeting: UIDatePicker!
    @IBOutlet weak var dateBeginMeeting: UIDatePicker!
    @IBOutlet weak var labelBeginMeeting: UILabel!
    @IBOutlet weak var labelEndMeeting: UILabel!
    @IBOutlet weak var adressMeeting: UITextView!
    @IBOutlet weak var mapView: MKMapView!
    
    var geocoder = CLGeocoder()
    
    var account: AccountModel!
    var date: NSDate!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.dateBeginMeeting.minimumDate = NSDate()
        
        var dictionaryOfAddresses: [String] = ["8 rue pierre curie, 92600, Asnieres sur seine", "10 place des vosges, 92400, Courbevoie"]
        for address in dictionaryOfAddresses {
            var geocoder = CLGeocoder()
            geocoder.geocodeAddressString(address, completionHandler: {(placemarks: [AnyObject]!, error: NSError!) -> Void in
                if let placemark = placemarks?[0] as? CLPlacemark {
                    if placemark.location != nil {
                        let span = MKCoordinateSpanMake(0.01, 0.01)
                        let region = MKCoordinateRegionMake(placemark.location.coordinate, span)
                        self.mapView.setRegion(region, animated: false)
                        let annotation = MKPointAnnotation()
                        annotation.setCoordinate(placemark.location.coordinate)
                        annotation.title = self.account.nameAccount
                        self.mapView.addAnnotation(annotation)
                        self.mapView.selectAnnotation(annotation, animated: true)
                    }
                }
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func dateChanged(sender: UIDatePicker) {
    }
    
    

}
