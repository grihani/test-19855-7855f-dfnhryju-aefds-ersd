//
//  CreerCompteViewController.swift
//  UIScrollViewForMobilite
//
//  Created by Formation iOS on 20/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class CreerCompteViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var usernameCRM: UITextField!
    @IBOutlet weak var passwordCRM: UITextField!
    @IBOutlet weak var pickerCRM: UIPickerView!
    @IBOutlet weak var pickerQestionSecrete: UIPickerView!
    @IBOutlet weak var reponseSecrete: UITextField!
    
    private var crm = ["Choississez un CRM", "Salesforce", "Microsoft Dynamics"]
    private var questionSecrete = ["Choississez une question secrète.", "Quel est le nom de votre ville natale ?", "Quel est le nom de votre premier annimal de compagnie ?"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let backItem = UIBarButtonItem(title: "Retour", style: .Bordered, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func creerButtonPressed(sender: UIButton) {
        // Vérification du renseignement des champs.
        let indexRowCRM = pickerCRM.selectedRowInComponent(0)
        let indexRowQS = pickerQestionSecrete.selectedRowInComponent(0)
        if (!username.text.isEmpty && !password.text.isEmpty && !mail.text.isEmpty && !usernameCRM.text.isEmpty && !passwordCRM.text.isEmpty && !reponseSecrete.text.isEmpty && indexRowCRM != 0 && indexRowQS != 0) {
            // Vérifie si l'adresse mail est valide.
            let userDataModel = UserDataModel()
            if isValidEmail(mail.text) {
                // On vérifie si le username ou le mail existe déjà en base.
                if userDataModel.isExistUser(username.text, mail: mail.text) {
                    let msgUserExiste = "Le nom d'utilisateur ou le mail est déjà utilisé."
                    let alert = UIAlertController(title: "ATTENTION", message: msgUserExiste, preferredStyle: .Alert)
                    let action = UIAlertAction(title: "Modifier", style: .Default, handler: nil)
                    alert.addAction(action)
                    presentViewController(alert, animated: true, completion: nil)
                } else {
                    var userModel = UserModel(idUser: UserModel().getMaxIdUser(), username: username.text, password: password.text, mail: mail.text, usernameCRM: usernameCRM.text, passwordCRM: passwordCRM.text, pickerCRM: crm[indexRowCRM], questionSecrete: questionSecrete[indexRowQS], reponseSecrete: reponseSecrete.text)
                    UserDataModel().inserUser(userModel)
                }
            }
        }
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        if let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx) {
            return emailTest.evaluateWithObject(email)
        }
        return false
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 0) {
            return crm.count
        } else {
            return questionSecrete.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if (pickerView.tag == 0) {
            return crm[row]
        } else {
            return questionSecrete[row]
        }
    }
}
