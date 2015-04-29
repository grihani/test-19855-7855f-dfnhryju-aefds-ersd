//
//  MotDePasseOublieViewController.swift
//  UIScrollViewForMobilite
//
//  Created by Formation iOS on 20/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit
import MessageUI

class MotDePasseOublieViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var reponseSecrete: UITextField!
    @IBOutlet weak var questionSecrete: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelReponse: UILabel!
    @IBOutlet weak var buttonVerifier: UIButton!
    var email: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        username.endEditing(true)
        reponseSecrete.endEditing(true)
    }

    @IBAction func editingUsernameTextField(sender: AnyObject) {
        let userModel = UserDataModel().getUserWithUsername(username.text)
        labelQuestion.hidden = false
        reponseSecrete.hidden = false
        questionSecrete.text = userModel.questionSecrete
        labelReponse.hidden = false
        buttonVerifier.hidden = false
    }
    
    @IBAction func verifReponseButtonPressed(sender: AnyObject) {
        var (bonCouple, email) = UserDataModel().isCorrectUsernameReponse(username.text, reponseSecrete: reponseSecrete.text)
        if bonCouple {
            // envoi d'un email pour nouveau mot de passe.
            self.email = email
            println("email: \(self.email)")
            let mailComposeViewController = configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.presentViewController(mailComposeViewController, animated: true, completion: nil)
            } else {
                self.showSendMailErrorAlert()
            }
        } else {
            let msgUserExiste = "Le couple nom d'utilisateur et réponse secrète ne correspond pas."
            let alert = UIAlertController(title: "ATTENTION", message: msgUserExiste, preferredStyle: .Alert)
            let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients([self.email])
        mailComposerVC.setSubject("Test envoi email in-app")
        mailComposerVC.setMessageBody("Body text email in-app", isHTML: false)
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device couldn't send email.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
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
