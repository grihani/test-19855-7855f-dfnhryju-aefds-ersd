//
//  AccountModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class AccountModel {
    
    let accountCreateSQL = "CREATE TABLE  IF NOT EXISTS Account (idAccount INTEGER NOT NULL, nameAccount TEXT, shortNameAccount TEXT, leadSource TEXT, statusAccount TEXT, industryAccount TEXT, segmentAccount TEXT, websiteAccount TEXT, phoneAccount TEXT, faxAccount TEXT, coverageAccount TEXT, regionAccount TEXT, adressAccount TEXT, idAccount1 INTEGER, countryAccount TEXT, typeAccount TEXT, CONSTRAINT PK_Account PRIMARY KEY (idAccount), FOREIGN KEY (idAccount) REFERENCES Account (idAccount)); "
    
    var idAccount: Int = 0
    var nameAccount: String = ""
    var shortNameAccount: String = ""
    var leadSource: String = ""
    var statusAccount: String = ""
    var industryAccount: String = ""
    var segmentAccount: String = ""
    var websiteAccount: String = ""
    var phoneAccount: String = ""
    var faxAccount: String = ""
    var coverageAccount: String = ""
    var regionAccount: String = ""
    var adressAccount: String = ""
    var idAccount1: Int = 0
    var countryAccount: String = ""
    var typeAccount: String = ""
    
    init() {
        self.idAccount = 0
        self.nameAccount = ""
        self.shortNameAccount = ""
        self.leadSource = ""
        self.statusAccount = ""
        self.industryAccount = ""
        self.segmentAccount = ""
        self.websiteAccount = ""
        self.phoneAccount = ""
        self.faxAccount = ""
        self.coverageAccount = ""
        self.regionAccount = ""
        self.adressAccount = ""
        self.idAccount1 = 0
        self.countryAccount = ""
        self.typeAccount = ""
    }
    
    convenience init(idAccount: Int) {
        self.init()
        self.idAccount = idAccount
    }
    
    init(idAccount: Int, nameAccount: String, shortNameAccount: String, leadSource: String, statusAccount: String, industryAccount: String, segmentAccount: String, websiteAccount: String, phoneAccount: String, faxAccount: String, coverageAccount: String, regionAccount: String, adressAccount: String, idAccount1: Int,countryAccount: String,typeAccount: String) {
            self.idAccount = idAccount
            self.nameAccount = nameAccount
            self.shortNameAccount = shortNameAccount
            self.leadSource = leadSource
            self.statusAccount = statusAccount
            self.industryAccount = industryAccount
            self.segmentAccount = segmentAccount
            self.websiteAccount = websiteAccount
            self.phoneAccount = phoneAccount
            self.faxAccount = faxAccount
            self.coverageAccount = coverageAccount
            self.regionAccount = regionAccount
            self.adressAccount = adressAccount
            self.idAccount1 = idAccount1
            self.countryAccount = countryAccount
            self.typeAccount = typeAccount
    }
    
        // utilisée pour l'insertion seulement
    func arrayFromModel() -> [AnyObject] {
        return [
            self.nameAccount,
            self.shortNameAccount,
            self.leadSource,
            self.statusAccount,
            self.industryAccount,
            self.segmentAccount,
            self.websiteAccount,
            self.phoneAccount,
            self.faxAccount,
            self.coverageAccount,
            self.regionAccount,
            self.adressAccount,
            self.idAccount1,
            self.countryAccount,
            self.typeAccount
        ]
    }
    // utilisée pour la comparaison seulement
    func arrayOfStringsFromModel() -> [String] {
        return [
            self.nameAccount,
            self.shortNameAccount,
            self.leadSource,
            self.statusAccount,
            self.industryAccount,
            self.segmentAccount,
            self.websiteAccount,
            self.phoneAccount,
            self.faxAccount,
            self.coverageAccount,
            self.regionAccount,
            self.adressAccount,
            String(self.idAccount1),
            self.countryAccount,
            self.typeAccount
        ]
    }
}