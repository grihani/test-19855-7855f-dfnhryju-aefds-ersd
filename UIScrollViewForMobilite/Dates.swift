//
//  Dates.swift
//  Four Weeks Calendar
//
//  Created by ghassane rihani on 22/03/2015.
//  Copyright (c) 2015 ghassane rihani. All rights reserved.
//

import Foundation

class Dates: NSObject {
    
    //used to create dates from string in class Dates
    enum GregorianEra:Int {
        case BC = 0
        case AD
    }
    
    let calendar = NSCalendar.currentCalendar()
    let date = NSDate()
    var daysOfWeek = [NSDate]()
    var daysOfWeekInCalendar = [NSDate]()
    
    // 1 week before, (numberOfWeeks -2) after
    func datesOfCalendar(numberOfWeeks: Int) -> [NSDate] {
        var dates = [NSDate]()
        
        var dateComponents = self.calendar.components(.CalendarUnitMonth | .WeekdayCalendarUnit | .CalendarUnitDay, fromDate: self.date)
        
        var beginingOfCalendar = calendar.dateByAddingUnit(
            .CalendarUnitDay,
            value: (0 - dateComponents.weekday - 6),
            toDate: self.date,
            options:.MatchNextTime)
        
        for i in 0...(numberOfWeeks * 7 - 1) {
            var dateToAdd = calendar.dateByAddingUnit(
                .CalendarUnitDay,
                value: (i),
                toDate: beginingOfCalendar!,
                options:.MatchNextTime)
            dates.append(dateToAdd!)
        }
        //dates = datesOfWeek(dates)
        self.daysOfWeekInCalendar = dates
        return dates
    }
    
    // dates without saturday nor sunday
    func datesOfWeek(datesOfWholeWeek : [NSDate]) -> [NSDate] {
        var datesOfWeek = [NSDate]()
        
        for dateWeek in datesOfWholeWeek as [NSDate] {
            var dateComponent = calendar.components( .WeekdayCalendarUnit , fromDate: dateWeek)
            if (dateComponent.weekday != 1) && (dateComponent.weekday != 7){
                datesOfWeek.append(dateWeek)
            }
        }
        
        return datesOfWeek
    }
    
    // this gives the days (numbers) of the calendar
    func arrayOfDays(dates: [NSDate]) -> [Int] {
        var arrayDays = [Int]()
        for days in dates {
            let dayComponents = calendar.components(.CalendarUnitDay, fromDate: days)
            arrayDays.append(dayComponents.day)
        }
        return arrayDays
    }
    
    //returns the month of the date
    func monthOfDate(chosenDate: NSDate) -> String {
        let months = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Decembre"]
        let monthComponents = calendar.components(.CalendarUnitMonth, fromDate: chosenDate)
        
        return months[monthComponents.month - 1]
    }
    
    // returns index of the date after the user has clicked on the day he wants shown
    func indexOfDate(chosenDate: NSDate) -> Int {
        let dayComponents = calendar.components( .CalendarUnitDay, fromDate: chosenDate)
        let arrayDays = self.arrayOfDays(self.daysOfWeekInCalendar)
        return find(arrayDays, dayComponents.day)!
    }
    
    // traduire de la date de l'iPad à une date qui s'enregistre dans la BDD
    func fromDateToStringDay(chosenDate:NSDate) -> String {
        let dayComponents = self.calendar.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate: chosenDate)
        var month:String
        var day:String
        if dayComponents.month < 10 {
            month = "0\(dayComponents.month)"
        } else {
            month = "\(dayComponents.month)"
        }
        if dayComponents.day < 10 {
            day = "0\(dayComponents.day)"
        } else {
            day = "\(dayComponents.day)"
        }
        let stringFromChosenDate = "\(dayComponents.year)-\(month)-\(day)"
        
        return stringFromChosenDate
    }
    
    // traduire de la date à l'heure qui s'enregistre dans la BDD
    func fromDateToStringHour(chosenDate:NSDate) -> String{
        let dayComponents = self.calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate: chosenDate)
        var hour:String
        var minutes:String
        if dayComponents.hour < 10 {
            hour = "0\(dayComponents.month)"
        } else {
            hour = "\(dayComponents.month)"
        }
        if dayComponents.minute < 10 {
            minutes = "0\(dayComponents.day)"
        } else {
            minutes = "\(dayComponents.day)"
        }
        let stringFromChosenDate = "\(hour):\(minutes)"
        
        return stringFromChosenDate
    }
    
    // traduire de la date à une date+heure qui s'enregistre dans la BDD
    func fromDateToSQLiteString(chosenDate:NSDate) -> String{
        let date = self.fromDateToStringDay(chosenDate)
        let hour = self.fromDateToStringHour(chosenDate)
        
        return "\(date) \(hour)"
    }
    
    // traduire de la date en BDD à une date utilisable sur IPad
    func fromSQLiteDayToDate(sQLiteDate: String) -> NSDate?{
        var year: Int
        var month: Int
        var day: Int
        var hour: Int
        var minute: Int
        var second: Int
        var nanosecond: Int
        //split the date received from the database
        var splitDateArray = split(sQLiteDate) { $0 == " "}
        var yearMonthDay: String = splitDateArray[0]
        var hourMinute: String? = splitDateArray.count > 1 ? splitDateArray[1] : nil
        
        // split the day components
        var yearMonthDayArray = split(yearMonthDay) { $0 == "-" }
        year = yearMonthDayArray[0].toInt()!
        month = yearMonthDayArray[1].toInt()!
        day = yearMonthDayArray[2].toInt()!
        
        //split the hour components
        if hourMinute != nil {
            var hourMinuteArray = split(hourMinute!) { $0 == ":" }
            hour = hourMinuteArray[0].toInt()!
            minute = hourMinuteArray[1].toInt()!
        } else {
            hour = 0
            minute = 0
        }
        second = 0
        nanosecond = 0
        
        var dateFromString = self.calendar.dateWithEra(GregorianEra.AD.rawValue, year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nanosecond)
        
        if let dateFromString = dateFromString {
            return dateFromString
        }
        return nil
    }
    
}