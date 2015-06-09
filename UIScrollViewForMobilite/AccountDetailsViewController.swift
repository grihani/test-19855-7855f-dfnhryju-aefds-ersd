//
//  Vue360ViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 02/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit
import MapKit

class AccountDetailsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var nameCompany: UITextField!
    @IBOutlet weak var shortNameCompany: UITextField!
    @IBOutlet weak var industryCompany: UITextField!
    @IBOutlet weak var phoneCompany: UITextField!
    @IBOutlet weak var webSite: UITextField!
    @IBOutlet weak var leadSource: UITextField!
    @IBOutlet weak var statusAccount: UITextField!
    @IBOutlet weak var segmentAccount: UITextField!
    @IBOutlet weak var faxAccount: UITextField!
    @IBOutlet weak var regionAccount: UITextField!
    @IBOutlet weak var adressCompany: UITextView!
    @IBOutlet weak var countryAccount: UITextField!
    @IBOutlet weak var coverageAccount: UITextField!
//    @IBOutlet weak var mapAdressCompany: MKMapView!
    @IBOutlet weak var leftView: UIView!
    
    var read: Bool! {
        didSet {
            if let read = read {
                if read {
                    disableFields()
                    update = false
                }
            }
        }
    }
    func disableFields() {
        nameCompany?.enabled = false
        shortNameCompany?.enabled = false
        industryCompany?.enabled = false
        phoneCompany?.enabled = false
        webSite?.enabled = false
        leadSource?.enabled = false
        segmentAccount?.enabled = false
        faxAccount?.enabled = false
        regionAccount?.enabled = false
        adressCompany?.editable = false
        countryAccount?.enabled = false
        coverageAccount?.enabled = false
        
        nameCompany?.borderStyle = .None
        shortNameCompany?.borderStyle = .None
        industryCompany?.borderStyle = .None
        phoneCompany?.borderStyle = .None
        webSite?.borderStyle = .None
        leadSource?.borderStyle = .None
        segmentAccount?.borderStyle = .None
        faxAccount?.borderStyle = .None
        regionAccount?.borderStyle = .None
        adressCompany?.layer.borderWidth = 0
        countryAccount?.borderStyle = .None
        coverageAccount?.borderStyle = .None
    }
    
    var update: Bool! {
        didSet {
            if let update = update {
                if update {
                    enableFields()
                    read = false
                }
            }
        }
    }
    func enableFields() {
        nameCompany?.enabled = true
        shortNameCompany?.enabled = true
        industryCompany?.enabled = true
        phoneCompany?.enabled = true
        webSite?.enabled = true
        leadSource?.enabled = true
        segmentAccount?.enabled = true
        faxAccount?.enabled = true
        regionAccount?.enabled = true
        adressCompany?.editable = true
        countryAccount?.enabled = true
        coverageAccount?.enabled = true
        
        nameCompany?.borderStyle = .RoundedRect
        shortNameCompany?.borderStyle = .RoundedRect
        industryCompany?.borderStyle = .RoundedRect
        phoneCompany?.borderStyle = .RoundedRect
        webSite?.borderStyle = .RoundedRect
        leadSource?.borderStyle = .RoundedRect
        segmentAccount?.borderStyle = .RoundedRect
        faxAccount?.borderStyle = .RoundedRect
        regionAccount?.borderStyle = .RoundedRect
        adressCompany?.layer.borderWidth = 01
        adressCompany?.layer.borderColor = UIColor.grayColor().CGColor
        countryAccount?.borderStyle = .RoundedRect
        coverageAccount?.borderStyle = .RoundedRect
    }
    
    
    var activeField: AnyObject!
    var account: AccountModel!
    var accountAfterUpdates: AccountModel!
    var locationManager = CLLocationManager()
    let fileManager = NSFileManager.defaultManager()
    var imageExists = true
    var modificationsHaveHappened: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        registerForKeyboardNotifications()
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        if account != nil {
            self.nameCompany.text = account.nameAccount
            self.shortNameCompany.text = account.shortNameAccount
            self.industryCompany.text = account.industryAccount
            self.phoneCompany.text = account.phoneAccount
            self.webSite.text = account.websiteAccount
            self.adressCompany.text = account.adressAccount
            self.leadSource.text = account.leadSource
            self.statusAccount.text = account.statusAccount
            self.segmentAccount.text = account.segmentAccount
            self.faxAccount.text = account.faxAccount
            self.regionAccount.text = account.regionAccount
            self.countryAccount.text = account.countryAccount
            self.coverageAccount.text = account.coverageAccount
        } else {
            disablefields()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setDelegates() {
        self.nameCompany.delegate = self
        self.shortNameCompany.delegate = self
        self.industryCompany.delegate = self
        self.phoneCompany.delegate = self
        self.webSite.delegate = self
        self.locationManager.delegate = self
        self.adressCompany.delegate = self
//        self.mapAdressCompany.delegate = self
        self.leadSource.delegate = self
        self.statusAccount.delegate = self
        self.segmentAccount.delegate = self
        self.faxAccount.delegate = self
        self.regionAccount.delegate = self
        self.countryAccount.delegate = self
        self.coverageAccount.delegate = self
    }
    func disablefields() {
        self.nameCompany.text = "Vous n'avez aucun compte d'enregistré ou aucun meeting de prévu avec des contacts appartenant à un compte"
        self.nameCompany.enabled = false
        self.shortNameCompany.text = ""
        self.shortNameCompany.enabled = false
        self.industryCompany.text = ""
        self.industryCompany.enabled = false
        self.phoneCompany.text = ""
        self.phoneCompany.enabled = false
        self.webSite.text = ""
        self.webSite.enabled = false
        self.adressCompany.text = ""
        self.adressCompany.editable = false
        self.leadSource.text = ""
        self.leadSource.enabled = false
        self.statusAccount.text = ""
        self.statusAccount.enabled = false
        self.segmentAccount.text = ""
        self.segmentAccount.enabled = false
        self.faxAccount.text = ""
        self.faxAccount.enabled = false
        self.regionAccount.text = ""
        self.regionAccount.enabled = false
        self.countryAccount.text = ""
        self.countryAccount.enabled = false
        self.coverageAccount.text = ""
        self.coverageAccount.enabled = false
    }
    
    func geolocaliseAvecImage(#address: String?, account: AccountModel, mapView: MKMapView) {
        if let address = address {
            // if the image exists put the image in place of the mapView
            // else create the mapView then show the image in its place
            if checkImageExist(address: address, account: account) {
                var frame = mapView.frame
                self.imageExists = true
                mapView.removeFromSuperview()
//                self.mapAdressCompany = nil
                var pathImage = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
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
//                            annotation.setCoordinate(placemark.location.coordinate)
                            annotation.title = account.nameAccount
                            mapView.addAnnotation(annotation)
                            mapView.selectAnnotation(annotation, animated: true)
                        } else {
                        
                        }
                    }
                })
            }
        }
    }
    
    // check if there's an image in the repertory for the mapview
    func checkImageExist(#address: String, account: AccountModel) -> Bool{
        var error: NSError?
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
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
                    
//                    annotation.setCoordinate(placemark.location.coordinate)
                    annotation.title = account.nameAccount
                    annotation.subtitle = account.phoneAccount
                    mapView.addAnnotation(annotation)
                    mapView.selectAnnotation(annotation, animated: true)
                }
            })
            
        }
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
    
    // Mark: - MapView Delegate methods
    // it will check if there's an image here so that we put it up
    func mapViewWillStartRenderingMap(mapView: MKMapView!) {
        if account != nil {
//            geolocaliseAvecImage(address: account.adressAccount, account: account, mapView: self.mapAdressCompany)
        }
    }
    func mapViewDidFinishRenderingMap(mapView: MKMapView!, fullyRendered: Bool) {
        if account != nil && !self.imageExists {
            var frame = mapView.frame
            var mapImage: UIImage = self.pictureForView(mapView)
            var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
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
            
//            println(imagePath)
        }
    }
    
    
    // Mark: - UITapGesture 
    // taping on the controller's view to get the keyboard to not show anymore
    @IBAction func finishedEditCompany(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func changeFieldsOfAccount(sender: AnyObject) {
        
    }
    
    
    @IBAction func changingFieldsOfAccount(sender: UITextField) {
        self.accountAfterUpdates = AccountModel(idAccount: account.idAccount, nameAccount: nameCompany.text, shortNameAccount: shortNameCompany.text, leadSource: leadSource.text, statusAccount: statusAccount.text, industryAccount: industryCompany.text, segmentAccount: segmentAccount.text, websiteAccount: webSite.text, phoneAccount: phoneCompany.text, faxAccount: faxAccount.text, coverageAccount: coverageAccount.text, regionAccount: regionAccount.text, adressAccount: adressCompany.text, idAccount1: account.idAccount1, countryAccount: countryAccount.text, typeAccount: account.typeAccount, favoriteAccount: account.favoriteAccount)
        
        let accountToCompare = accountAfterUpdates.arrayOfStringsFromModel()
        let accountToCompareTo = account.arrayOfStringsFromModel()
        if !(accountToCompareTo == accountToCompare) {
            modificationsHaveHappened = true
        } else {
            modificationsHaveHappened = false
        }
    }
    
    // Mark: - Notifications
    func registerForKeyboardNotifications() {
        
    }
    func keyBoardWasShown(aNotification: NSNotification) {
    }
    func keyboardWillBeHidden(aNotification: NSNotification) {
    }
    
    // Mark: - TextField delegate methods
    func textFieldDidBeginEditing(textField: UITextField) {
        self.activeField = textField
    }
    func textFieldDidEndEditing(textField: UITextField) {
        self.activeField = nil
    }
    
    // Mark: - TextView delegate methods
    func textViewDidBeginEditing(textView: UITextView) {
        self.activeField = textView
    }
    func textViewDidChange(textView: UITextView) {
        self.accountAfterUpdates = AccountModel(idAccount: account.idAccount, nameAccount: nameCompany.text, shortNameAccount: shortNameCompany.text, leadSource: leadSource.text, statusAccount: statusAccount.text, industryAccount: industryCompany.text, segmentAccount: segmentAccount.text, websiteAccount: webSite.text, phoneAccount: phoneCompany.text, faxAccount: faxAccount.text, coverageAccount: coverageAccount.text, regionAccount: regionAccount.text, adressAccount: adressCompany.text, idAccount1: account.idAccount1, countryAccount: countryAccount.text, typeAccount: account.typeAccount, favoriteAccount: account.favoriteAccount)
        let accountToCompare = accountAfterUpdates.arrayOfStringsFromModel()
        let accountToCompareTo = account.arrayOfStringsFromModel()
        if !(accountToCompareTo == accountToCompare) {
            modificationsHaveHappened = true
        } else {
            modificationsHaveHappened = false
        }
    }
    func textViewDidEndEditing(textView: UITextView) {
        self.activeField = nil
    }
    
    // Mark: - CLLocationManager delegate methods
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        //        println(locations.last)
    }
    
    // Mark: - UIButton: saving and discarding changes
    @IBAction func savingChanges(sender: UIButton) {
        updateAccount()
    }
    @IBAction func discardingChanges(sender: UIButton) {
        discardChanges()
    }
    
    // Mark: - functions to save and discard changes
    func updateAccount() {
        
        if modificationsHaveHappened {
            AccountDataModel().updateAccount(account: accountAfterUpdates)
        }
        modificationsHaveHappened = false
    }
    
    func discardChanges() {
        var accountIntermediaire = self.account
        self.account = self.accountAfterUpdates
        self.accountAfterUpdates = accountIntermediaire
        
        self.nameCompany.text = account.nameAccount
        self.shortNameCompany.text = account.shortNameAccount
        self.industryCompany.text = account.industryAccount
        self.phoneCompany.text = account.phoneAccount
        self.webSite.text = account.websiteAccount
        self.adressCompany.text = account.adressAccount
        self.leadSource.text = account.leadSource
        self.statusAccount.text = account.statusAccount
        self.segmentAccount.text = account.segmentAccount
        self.faxAccount.text = account.faxAccount
        self.regionAccount.text = account.regionAccount
        self.countryAccount.text = account.countryAccount
        self.coverageAccount.text = account.coverageAccount
        modificationsHaveHappened = true
        updateAccount()
        self.account = accountIntermediaire
    }
}
