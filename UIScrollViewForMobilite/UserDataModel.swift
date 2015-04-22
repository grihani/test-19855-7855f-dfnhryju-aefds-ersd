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
        println(querySQL)
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
    
    func isExistUser(username: String, mail: String) -> Bool {
        var querySQL = "SELECT idUser FROM User WHERE username = '\(username)' OR mail = '\(mail)'"
        let result: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let result = result {
            return false
        }
        return true
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