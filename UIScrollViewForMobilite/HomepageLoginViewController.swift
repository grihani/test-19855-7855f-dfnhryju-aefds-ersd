//
//  HomepageLoginViewController.swift
//  UIScrollViewForMobilite
//
//  Created by Formation iOS on 20/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class HomepageLoginViewController: UIViewController {

    // MARK: - IBOutlets defined in the storyboard
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!{didSet {
        loginButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        loginButton.backgroundColor = blueCheckedColor
    }}
    
    @IBOutlet weak var forgottenPasswordButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    // MARK: - Variables
    var idUser = 0
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        username.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - General touch events
    var viewOfTouch: UIView! = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: 20, height: 20)))
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        username.endEditing(true)
        password.endEditing(true)
        for touch in touches {
            var location = touch.locationInView(self.view)
            location.x -= 10
            location.y -= 10
            viewOfTouch.frame.origin = location
            viewOfTouch.backgroundColor = UIColor.redColor()
            viewOfTouch.alpha = 0.30
            viewOfTouch.layer.cornerRadius = 10
            self.view.insertSubview(viewOfTouch, atIndex: 100)
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        for touch in touches {
            var location = touch.locationInView(self.view)
            location.x -= 10
            location.y -= 10
            viewOfTouch.frame.origin = location
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        viewOfTouch.removeFromSuperview()
    }
    
    // MARK: - Keyboard related events
        // go to next textfield
    @IBAction func nextPressed(sender: UITextField) {
        if username.isFirstResponder() {
            password.becomeFirstResponder()
        }
    }
        // log the user
    @IBAction func goPressed(sender: UITextField) {
        logUser()
        
    }
    
    // MARK: - IBactions for buttons
    @IBAction func logInButtonPressed(sender: UIButton) {
        logUser()
    }
    
    // MARK: - Functions
    
        // function to log the user
    func logUser() {
        // Vérification du nom d'utilisateur
        var (userExiste, userId) = UserDataModel().isTrueUserWithUsernameAndPassword(username.text, password: password.text)
        if (userExiste) {
            let userModel = UserDataModel().getUserWithIdUser(userId)
            self.idUser = userId
            // Afficher la page d'accueil de l'utilisateur.
            performSegueWithIdentifier("logIn", sender: self)
        } else {
            let msgUserExiste = "The username or password are not correct."
            let alert = UIAlertController(title: "BEWARE", message: msgUserExiste, preferredStyle: .Alert)
            let action = UIAlertAction(title: "Change", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "logIn" {
            if let destinationVC = (segue.destinationViewController as UINavigationController).topViewController as? HomepageUserViewController {
                destinationVC.idUser = self.idUser
            }
        }
    }
    
    // MARK: - Unwind segues
    @IBAction func backButton(segue: UIStoryboardSegue) {
        username.text = ""
        password.text = ""
        username.becomeFirstResponder()
    }
}
