//
//  HomepageLoginViewController.swift
//  UIScrollViewForMobilite
//
//  Created by Formation iOS on 20/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class HomepageLoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
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
            // Afficher la page d'accueil de l'utilisateur.
            performSegueWithIdentifier("logIn", sender: self)
            println("Bonjour, \(username.text)")
        } else {
            let msgUserExiste = "Le nom d'utilisateur ou le mot de passe n'est pas correct."
            let alert = UIAlertController(title: "ATTENTION", message: msgUserExiste, preferredStyle: .Alert)
            let action = UIAlertAction(title: "Modifier", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func backButton(segue: UIStoryboardSegue) {
        
    }
    

    /*@IBAction func backgroundTap(sender: AnyObject) {
        username.resignFirstResponder()
        password.resignFirstResponder()
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
