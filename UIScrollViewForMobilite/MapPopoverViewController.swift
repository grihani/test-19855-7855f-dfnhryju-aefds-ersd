//
//  MapPopoverViewController.swift
//  UIScrollViewForMobilite
//
//  Created by Formation iOS on 07/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit
import MapKit

class MapPopoverViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var account: AccountModel = AccountModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                    
                    annotation.setCoordinate(placemark.location.coordinate)
                    annotation.title = account.nameAccount
                    annotation.subtitle = account.phoneAccount
                    mapView.addAnnotation(annotation)
                    mapView.selectAnnotation(annotation, animated: true)
                }
            })
            
        }
    }
    
    // Mark: - MapView Delegate methods
    // it will check if there's an image here so that we put it up
    //    func mapViewWillStartRenderingMap(mapView: MKMapView!) {
    //        if account != nil {
    //            geolocaliseAvecImage(address: account.adressAccount, account: account, mapView: self.mapAdressCompany)
    //        }
    //    }
    //    func mapViewDidFinishRenderingMap(mapView: MKMapView!, fullyRendered: Bool) {
    //        if account != nil && !self.imageExists {
    //            var frame = mapView.frame
    //            var mapImage: UIImage = self.pictureForView(mapView)
    //            var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    //            var dirPath = paths.stringByAppendingPathComponent("Maps/\(account.idAccount)/")
    //            var imagePath = dirPath.stringByAppendingPathComponent("\(account.adressAccount).png")
    //            if !fileManager.fileExistsAtPath(imagePath) {
    ////                fileManager.createDirectoryAtPath(dirPath, withIntermediateDirectories: true, attributes: nil, error: nil)
    //                UIImagePNGRepresentation(mapImage).writeToFile(imagePath, atomically: true)
    //
    //            }
    //            mapView.removeFromSuperview()
    //            var image = UIImageView(image: UIImage(contentsOfFile: imagePath))
    //            image.frame = frame
    //            self.leftView.addSubview(image)
    //            
    ////            println(imagePath)
    //        }
    //    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
