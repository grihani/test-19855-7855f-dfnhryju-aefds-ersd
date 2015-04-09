//
//  FunctionsBeforeKnowledge.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 09/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class FunctionsBeforeKnowledge {
    // fonction de comparaison d'arrays. Sera peut-être utile plus tard
    func compareArrays(#firstArray: [String], secondArray: [String]) -> Bool {
        if firstArray.count != secondArray.count {
            return false
        } else {
            if firstArray.isEmpty {
                return true
            } else {
                var firstToCompare = firstArray
                var secondToCompare = secondArray
                if firstToCompare.removeAtIndex(0) == secondToCompare.removeAtIndex(0) {
                    return compareArrays(firstArray: firstToCompare, secondArray: secondToCompare)
                } else {
                    return false
                }
            }
        }
    }
}