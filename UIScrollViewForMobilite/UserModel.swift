//
//  UserModel.swift
//  UIScrollViewForMobilite
//
//  Created by Formation iOS on 20/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class UserModel {
    
    let userCreateSQL = "CREATE TABLE IF NOT EXISTS User (idUser INTEGER NOT NULL, username TEXT, password TEXT, mail TEXT, usernameCRM TEXT, passwordCRM TEXT, pickerCRM TEXT, questionSecrete TEXT, reponseSecrete TEXT, CONSTRAINT PK_User PRIMARY KEY (idUser));"
    
    var idUser: Int
    var username: String
    var password: String
    var mail: String
    var usernameCRM: String
    var passwordCRM: String
    var pickerCRM: String
    var questionSecrete: String
    var reponseSecrete: String
    
    init() {
        self.idUser = 0
        self.username = ""
        self.password = ""
        self.mail = ""
        self.usernameCRM = ""
        self.passwordCRM = ""
        self.pickerCRM = ""
        self.questionSecrete = ""
        self.reponseSecrete = ""
    }
    
    init(idUser: Int, username: String, password: String, mail: String, usernameCRM: String, passwordCRM: String, pickerCRM: String, questionSecrete: String, reponseSecrete: String) {
        self.idUser = idUser
        self.username = username
        self.password = password
        self.mail = mail
        self.usernameCRM = usernameCRM
        self.passwordCRM = passwordCRM
        self.pickerCRM = pickerCRM
        self.questionSecrete = questionSecrete
        self.reponseSecrete = reponseSecrete
    }
    
    func arrayFromModel() -> [AnyObject] {
        return [self.username, self.password, self.mail, self.usernameCRM, self.passwordCRM, self.pickerCRM, self.questionSecrete, self.reponseSecrete]
    }
    
    func getMaxIdUser() -> Int {
        return UserDataModel().getMaxUserId()
    }
}