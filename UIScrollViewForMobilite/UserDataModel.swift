//
//  UserDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by Formation iOS on 20/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class UserDataModel {
    
    func inserUser(user: UserModel) -> String {
        var erreur = String()
        let insertSQL = "INSERT INTO User (username, password, mail, usernameCRM, passwordCRM, pickerCRM, questionSecrete, reponseSecrete) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: user.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
    
    func isTrueUserWithUsernameAndPassword(username: String, password: String) -> (resultat : Bool, idUser : Int) {
        var querySQL = "SELECT idUser FROM User WHERE username = '\(username)' AND password = '\(password)'"
        let result: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let result = result {
            if result.next() {
                var idUser: Int = Int(result.intForColumn("idUser"))
                if idUser == 0 {
                    return (false, 0)
                } else {
                    return (true, idUser)
                }
            }
        }
        return (false,0)
    }
    
    func isCorrectUsernameReponse(username: String, reponseSecrete: String) -> (resultat: Bool, email: String) {
        var querySQL = "SELECT mail FROM User WHERE username = '\(username)' AND reponseSecrete = '\(reponseSecrete)'"
        println(querySQL)
        let result: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let result = result {
            if result.next() {
                var email: String = result.stringForColumn("mail")
                println("mail: \(email)")
                return (true, email)
            }
        }
        return (false,"")
    }
    
    func isExistUser(username: String, mail: String) -> Bool {
        var querySQL = "SELECT idUser FROM User WHERE username = '\(username)' OR mail = '\(mail)'"
        let result: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let result = result {
            if result.next() {
                var idUser: Int = Int(result.intForColumn("IdUser"))
                return true
            }
            return false
        }
        return false
    }
    
    func getUserWithIdUser(idUser: Int) -> UserModel {
        var userModel = UserModel()
        var querySQL = "SELECT DISTINCT idUser, username, password, mail, usernameCRM, passwordCRM, pickerCRM, questionSecrete, reponseSecrete FROM User WHERE idUser = '\(idUser)'"
        let result: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let result = result {
            if result.next() {
                var idUser: Int = Int(result.intForColumn("idUser"))
                var username: String = result.stringForColumn("username")
                var password: String = result.stringForColumn("password")
                var mail: String = result.stringForColumn("mail")
                var usernameCRM: String = result.stringForColumn("usernameCRM")
                var passwordCRM: String = result.stringForColumn("passwordCRM")
                var pickerCRM: String = result.stringForColumn("pickerCRM")
                var questionSecrete: String = result.stringForColumn("questionSecrete")
                var reponseSecrete: String = result.stringForColumn("reponseSecrete")
                userModel = UserModel(idUser: idUser, username: username, password: password, mail: mail, usernameCRM: usernameCRM, passwordCRM: passwordCRM, pickerCRM: pickerCRM, questionSecrete: questionSecrete, reponseSecrete: reponseSecrete)
            }
        }
        return userModel
    }
    
    func getUserWithUsername(username: String) -> UserModel {
        var userModel = UserModel()
        var querySQL = "SELECT DISTINCT idUser, username, password, mail, usernameCRM, passwordCRM, pickerCRM, questionSecrete, reponseSecrete FROM User WHERE username = '\(username)'"
        let result: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let result = result {
            if result.next() {
                var idUser: Int = Int(result.intForColumn("idUser"))
                var username: String = result.stringForColumn("username")
                var password: String = result.stringForColumn("password")
                var mail: String = result.stringForColumn("mail")
                var usernameCRM: String = result.stringForColumn("usernameCRM")
                var passwordCRM: String = result.stringForColumn("passwordCRM")
                var pickerCRM: String = result.stringForColumn("pickerCRM")
                var questionSecrete: String = result.stringForColumn("questionSecrete")
                var reponseSecrete: String = result.stringForColumn("reponseSecrete")
                userModel = UserModel(idUser: idUser, username: username, password: password, mail: mail, usernameCRM: usernameCRM, passwordCRM: passwordCRM, pickerCRM: pickerCRM, questionSecrete: questionSecrete, reponseSecrete: reponseSecrete)
            }
        }
        return userModel
    }
    
    func getMaxUserId() -> Int {
        var querySQL = "SELECT MAX(idUser) FROM User"
        let result: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let result = result {
            return Int(result.intForColumnIndex(1))
        }
        return 1
    }
}