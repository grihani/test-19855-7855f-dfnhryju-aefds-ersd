//
//  ContractsModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class ContractsModel {
    
    let contractCreateSQL = "CREATE TABLE IF NOT EXISTS Contracts (idContract INTEGER NOT NULL, subjectContract TEXT, valueContract TEXT, dateContract TEXT, statusContract TEXT, CONSTRAINT PK_Contracts PRIMARY KEY (idContract));"
    
    var idContract: Int
    var subjectContract: String
    var valueContract: String
    var dateContract: String
    var statusContract: String
    
    init() {
        self.idContract = 0
        self.subjectContract = ""
        self.valueContract = ""
        self.dateContract = ""
        self.statusContract = ""
    }
    
    init(idContract: Int, subjectContract: String, valueContract: String, dateContract: String, statusContract: String) {
        self.idContract = idContract
        self.subjectContract = subjectContract
        self.valueContract = valueContract
        self.dateContract = dateContract
        self.statusContract = statusContract
    }
    
    func arrayFromModel() -> [AnyObject] {
        return [self.subjectContract, self.valueContract, self.dateContract, self.statusContract]
    }
}