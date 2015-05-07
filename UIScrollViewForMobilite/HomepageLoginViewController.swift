//
//  HomepageLoginViewController.swift
//  UIScrollViewForMobilite
//
//  Created by Formation iOS on 20/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class HomepageLoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField! {
        didSet {
            username.text = "test"
        }
    }
    @IBOutlet weak var password: UITextField!{
        didSet {
            password.text = "test"
        }
    }
    var idUser = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logInButtonPressed(sender: UIButton) {
        // Vérification du nom d'utilisateur
        var (userExiste, userId) = UserDataModel().isTrueUserWithUsernameAndPassword(username.text, password: password.text)
        if (userExiste) {
            let userModel = UserDataModel().getUserWithIdUser(userId)
            self.idUser = userId
            // Afficher la page d'accueil de l'utilisateur.
            performSegueWithIdentifier("logIn", sender: self)
        } else {
            let msgUserExiste = "Le nom d'utilisateur ou le mot de passe n'est pas correct."
            let alert = UIAlertController(title: "ATTENTION", message: msgUserExiste, preferredStyle: .Alert)
            let action = UIAlertAction(title: "Modifier", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        username.endEditing(true)
        password.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "logIn" {
            if let destinationVC = (segue.destinationViewController as UINavigationController).topViewController as? HomepageUserViewController {
                destinationVC.idUser = self.idUser
            }
        }
    }
    
    @IBAction func backButton(segue: UIStoryboardSegue) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
