//
//  Bouchonnage.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class Bouchonnage {
    var accounts = [[ "1" , "test 1 SA" , "test 1" , "aa 1" , "bb 1" , "cc 1" , "dd 1" , "www.quelquechose1.com" , "0699048436" , "0603403171" , "quelquechose1" , "quelquepart1" , "10 place de quelquepart1" , "1" , "Belgium" ]]
    func remplirAccounts() {
        self.accounts.append([ "2" , "test 2 SA" , "test 2" , "aa 2" , "bb 2" , "cc 2" , "dd 2" , "www.quelquechose2.com" , "0609361823" , "0668713654" , "quelquechose2" , "quelquepart2" , "10 place de quelquepart2" , "1" , "Spain" ])
        self.accounts.append([ "3" , "test 3 SA" , "test 3" , "aa 3" , "bb 3" , "cc 3" , "dd 3" , "www.quelquechose3.com" , "0679371100" , "0686356394" , "quelquechose3" , "quelquepart3" , "10 place de quelquepart3" , "1" , "Spain" ])
        self.accounts.append([ "4" , "test 4 SA" , "test 4" , "aa 4" , "bb 4" , "cc 4" , "dd 4" , "www.quelquechose4.com" , "0633179545" , "0607333916" , "quelquechose4" , "quelquepart4" , "10 place de quelquepart4" , "1" , "Spain" ])
        self.accounts.append([ "5" , "test 5 SA" , "test 5" , "aa 5" , "bb 5" , "cc 5" , "dd 5" , "www.quelquechose5.com" , "0624483268" , "0600862008" , "quelquechose5" , "quelquepart5" , "10 place de quelquepart5" , "1" , "france" ])
        self.accounts.append([ "6" , "test 6 SA" , "test 6" , "aa 6" , "bb 6" , "cc 6" , "dd 6" , "www.quelquechose6.com" , "0608552874" , "0684792529" , "quelquechose6" , "quelquepart6" , "10 place de quelquepart6" , "1" , "Belgium" ])
        self.accounts.append([ "7" , "test 7 SA" , "test 7" , "aa 7" , "bb 7" , "cc 7" , "dd 7" , "www.quelquechose7.com" , "0637049276" , "0615188025" , "quelquechose7" , "quelquepart7" , "10 place de quelquepart7" , "1" , "Belgium" ])
        self.accounts.append([ "8" , "test 8 SA" , "test 8" , "aa 8" , "bb 8" , "cc 8" , "dd 8" , "www.quelquechose8.com" , "0690976146" , "0684653193" , "quelquechose8" , "quelquepart8" , "10 place de quelquepart8" , "2" , "Spain" ])
        self.accounts.append([ "9" , "test 9 SA" , "test 9" , "aa 9" , "bb 9" , "cc 9" , "dd 9" , "www.quelquechose9.com" , "0693695904" , "0634966259" , "quelquechose9" , "quelquepart9" , "10 place de quelquepart9" , "2" , "Spain" ])
        self.accounts.append([ "10" , "test 10 SA" , "test 10" , "aa 10" , "bb 10" , "cc 10" , "dd 10" , "www.quelquechose10.com" , "0687240184" , "0650658062" , "quelquechose10" , "quelquepart10" , "10 place de quelquepart10" , "2" , "Spain" ])
        self.accounts.append([ "11" , "test 11 SA" , "test 11" , "aa 11" , "bb 11" , "cc 11" , "dd 11" , "www.quelquechose11.com" , "0671717123" , "0659391887" , "quelquechose11" , "quelquepart11" , "10 place de quelquepart11" , "2" , "Belgium" ])
        self.accounts.append([ "12" , "test 12 SA" , "test 12" , "aa 12" , "bb 12" , "cc 12" , "dd 12" , "www.quelquechose12.com" , "0607804612" , "0693518703" , "quelquechose12" , "quelquepart12" , "10 place de quelquepart12" , "2" , "Belgium" ])
        self.accounts.append([ "13" , "test 13 SA" , "test 13" , "aa 13" , "bb 13" , "cc 13" , "dd 13" , "www.quelquechose13.com" , "0619417028" , "0627337645" , "quelquechose13" , "quelquepart13" , "10 place de quelquepart13" , "10" , "france" ])
        self.accounts.append([ "14" , "test 14 SA" , "test 14" , "aa 14" , "bb 14" , "cc 14" , "dd 14" , "www.quelquechose14.com" , "0685931371" , "0687037314" , "quelquechose14" , "quelquepart14" , "10 place de quelquepart14" , "10" , "Belgium" ])
        self.accounts.append([ "15" , "test 15 SA" , "test 15" , "aa 15" , "bb 15" , "cc 15" , "dd 15" , "www.quelquechose15.com" , "0692382455" , "0645870247" , "quelquechose15" , "quelquepart15" , "10 place de quelquepart15" , "10" , "Belgium" ])
        self.accounts.append([ "16" , "test 16 SA" , "test 16" , "aa 16" , "bb 16" , "cc 16" , "dd 16" , "www.quelquechose16.com" , "0671841939" , "0630812645" , "quelquechose16" , "quelquepart16" , "10 place de quelquepart16" , "10" , "Spain" ])
        self.accounts.append([ "17" , "test 17 SA" , "test 17" , "aa 17" , "bb 17" , "cc 17" , "dd 17" , "www.quelquechose17.com" , "0669835481" , "0698275385" , "quelquechose17" , "quelquepart17" , "10 place de quelquepart17" , "10" , "Spain" ])
        self.accounts.append([ "18" , "test 18 SA" , "test 18" , "aa 18" , "bb 18" , "cc 18" , "dd 18" , "www.quelquechose18.com" , "0621502205" , "0600152571" , "quelquechose18" , "quelquepart18" , "10 place de quelquepart18" , "10" , "france" ])
        self.accounts.append([ "19" , "test 19 SA" , "test 19" , "aa 19" , "bb 19" , "cc 19" , "dd 19" , "www.quelquechose19.com" , "0644763771" , "0625007638" , "quelquechose19" , "quelquepart19" , "10 place de quelquepart19" , "10" , "france" ])
        self.accounts.append([ "20" , "test 20 SA" , "test 20" , "aa 20" , "bb 20" , "cc 20" , "dd 20" , "www.quelquechose20.com" , "0601445659" , "0689888827" , "quelquechose20" , "quelquepart20" , "10 place de quelquepart20" , "8" , "france" ])
        self.accounts.append([ "21" , "test 21 SA" , "test 21" , "aa 21" , "bb 21" , "cc 21" , "dd 21" , "www.quelquechose21.com" , "0615945512" , "0676350351" , "quelquechose21" , "quelquepart21" , "10 place de quelquepart21" , "8" , "Spain" ])
        self.accounts.append([ "22" , "test 22 SA" , "test 22" , "aa 22" , "bb 22" , "cc 22" , "dd 22" , "www.quelquechose22.com" , "0672764438" , "0630817988" , "quelquechose22" , "quelquepart22" , "10 place de quelquepart22" , "8" , "france" ])
        self.accounts.append([ "23" , "test 23 SA" , "test 23" , "aa 23" , "bb 23" , "cc 23" , "dd 23" , "www.quelquechose23.com" , "0691872088" , "0671745537" , "quelquechose23" , "quelquepart23" , "10 place de quelquepart23" , "8" , "france" ])
        self.accounts.append([ "24" , "test 24 SA" , "test 24" , "aa 24" , "bb 24" , "cc 24" , "dd 24" , "www.quelquechose24.com" , "0613784691" , "0662345883" , "quelquechose24" , "quelquepart24" , "10 place de quelquepart24" , "8" , "Spain" ])
        self.accounts.append([ "25" , "test 25 SA" , "test 25" , "aa 25" , "bb 25" , "cc 25" , "dd 25" , "www.quelquechose25.com" , "0671449132" , "0600130900" , "quelquechose25" , "quelquepart25" , "10 place de quelquepart25" , "0" , "france" ])
        self.accounts.append([ "26" , "test 26 SA" , "test 26" , "aa 26" , "bb 26" , "cc 26" , "dd 26" , "www.quelquechose26.com" , "0692917165" , "0608285652" , "quelquechose26" , "quelquepart26" , "10 place de quelquepart26" , "0" , "france" ])
        self.accounts.append([ "27" , "test 27 SA" , "test 27" , "aa 27" , "bb 27" , "cc 27" , "dd 27" , "www.quelquechose27.com" , "0625622342" , "0681854347" , "quelquechose27" , "quelquepart27" , "10 place de quelquepart27" , "0" , "france" ])
        self.accounts.append([ "28" , "test 28 SA" , "test 28" , "aa 28" , "bb 28" , "cc 28" , "dd 28" , "www.quelquechose28.com" , "0651612613" , "0659849221" , "quelquechose28" , "quelquepart28" , "10 place de quelquepart28" , "0" , "france" ])
        self.accounts.append([ "29" , "test 29 SA" , "test 29" , "aa 29" , "bb 29" , "cc 29" , "dd 29" , "www.quelquechose29.com" , "0677981017" , "0667140620" , "quelquechose29" , "quelquepart29" , "10 place de quelquepart29" , "0" , "france" ])
        self.accounts.append([ "30" , "test 30 SA" , "test 30" , "aa 30" , "bb 30" , "cc 30" , "dd 30" , "www.quelquechose30.com" , "0674149639" , "0615779217" , "quelquechose30" , "quelquepart30" , "10 place de quelquepart30" , "0" , "france" ])
        self.accounts.append([ "31" , "test 31 SA" , "test 31" , "aa 31" , "bb 31" , "cc 31" , "dd 31" , "www.quelquechose31.com" , "0695264007" , "0602910100" , "quelquechose31" , "quelquepart31" , "10 place de quelquepart31" , "0" , "france" ])
        self.accounts.append([ "32" , "test 32 SA" , "test 32" , "aa 32" , "bb 32" , "cc 32" , "dd 32" , "www.quelquechose32.com" , "0655354640" , "0655804073" , "quelquechose32" , "quelquepart32" , "10 place de quelquepart32" , "0" , "france" ])
        self.accounts.append([ "33" , "test 33 SA" , "test 33" , "aa 33" , "bb 33" , "cc 33" , "dd 33" , "www.quelquechose33.com" , "0616359443" , "0615257942" , "quelquechose33" , "quelquepart33" , "10 place de quelquepart33" , "0" , "Spain" ])
        self.accounts.append([ "34" , "test 34 SA" , "test 34" , "aa 34" , "bb 34" , "cc 34" , "dd 34" , "www.quelquechose34.com" , "0660166834" , "0697122217" , "quelquechose34" , "quelquepart34" , "10 place de quelquepart34" , "0" , "Belgium" ])
        self.accounts.append([ "35" , "test 35 SA" , "test 35" , "aa 35" , "bb 35" , "cc 35" , "dd 35" , "www.quelquechose35.com" , "0684737817" , "0619481994" , "quelquechose35" , "quelquepart35" , "10 place de quelquepart35" , "0" , "france" ])
        self.accounts.append([ "36" , "test 36 SA" , "test 36" , "aa 36" , "bb 36" , "cc 36" , "dd 36" , "www.quelquechose36.com" , "0696465016" , "0607967779" , "quelquechose36" , "quelquepart36" , "10 place de quelquepart36" , "0" , "Belgium" ])
        self.accounts.append([ "37" , "test 37 SA" , "test 37" , "aa 37" , "bb 37" , "cc 37" , "dd 37" , "www.quelquechose37.com" , "0635511165" , "0688745886" , "quelquechose37" , "quelquepart37" , "10 place de quelquepart37" , "0" , "Belgium" ])
        self.accounts.append([ "38" , "test 38 SA" , "test 38" , "aa 38" , "bb 38" , "cc 38" , "dd 38" , "www.quelquechose38.com" , "0601839135" , "0659373123" , "quelquechose38" , "quelquepart38" , "10 place de quelquepart38" , "0" , "Spain" ])
        self.accounts.append([ "39" , "test 39 SA" , "test 39" , "aa 39" , "bb 39" , "cc 39" , "dd 39" , "www.quelquechose39.com" , "0646144724" , "0666074826" , "quelquechose39" , "quelquepart39" , "10 place de quelquepart39" , "0" , "france" ])
        self.accounts.append([ "40" , "test 40 SA" , "test 40" , "aa 40" , "bb 40" , "cc 40" , "dd 40" , "www.quelquechose40.com" , "0609529849" , "0630429737" , "quelquechose40" , "quelquepart40" , "10 place de quelquepart40" , "0" , "Spain" ])
        self.accounts.append([ "41" , "test 41 SA" , "test 41" , "aa 41" , "bb 41" , "cc 41" , "dd 41" , "www.quelquechose41.com" , "0634218527" , "0619093255" , "quelquechose41" , "quelquepart41" , "10 place de quelquepart41" , "0" , "france" ])
        self.accounts.append([ "42" , "test 42 SA" , "test 42" , "aa 42" , "bb 42" , "cc 42" , "dd 42" , "www.quelquechose42.com" , "0640532116" , "0649626675" , "quelquechose42" , "quelquepart42" , "10 place de quelquepart42" , "0" , "france" ])
        self.accounts.append([ "43" , "test 43 SA" , "test 43" , "aa 43" , "bb 43" , "cc 43" , "dd 43" , "www.quelquechose43.com" , "0613026847" , "0603724240" , "quelquechose43" , "quelquepart43" , "10 place de quelquepart43" , "0" , "france" ])
        self.accounts.append([ "44" , "test 44 SA" , "test 44" , "aa 44" , "bb 44" , "cc 44" , "dd 44" , "www.quelquechose44.com" , "0683331747" , "0675546770" , "quelquechose44" , "quelquepart44" , "10 place de quelquepart44" , "0" , "Belgium" ])
        self.accounts.append([ "45" , "test 45 SA" , "test 45" , "aa 45" , "bb 45" , "cc 45" , "dd 45" , "www.quelquechose45.com" , "0628847870" , "0697263729" , "quelquechose45" , "quelquepart45" , "10 place de quelquepart45" , "0" , "Spain" ])
        self.accounts.append([ "46" , "test 46 SA" , "test 46" , "aa 46" , "bb 46" , "cc 46" , "dd 46" , "www.quelquechose46.com" , "0658497205" , "0609480380" , "quelquechose46" , "quelquepart46" , "10 place de quelquepart46" , "0" , "Spain" ])
        self.accounts.append([ "47" , "test 47 SA" , "test 47" , "aa 47" , "bb 47" , "cc 47" , "dd 47" , "www.quelquechose47.com" , "0650188000" , "0646979446" , "quelquechose47" , "quelquepart47" , "10 place de quelquepart47" , "0" , "france" ])
        self.accounts.append([ "48" , "test 48 SA" , "test 48" , "aa 48" , "bb 48" , "cc 48" , "dd 48" , "www.quelquechose48.com" , "0618066387" , "0692980412" , "quelquechose48" , "quelquepart48" , "10 place de quelquepart48" , "0" , "Spain" ])
        self.accounts.append([ "49" , "test 49 SA" , "test 49" , "aa 49" , "bb 49" , "cc 49" , "dd 49" , "www.quelquechose49.com" , "0612339199" , "0638830063" , "quelquechose49" , "quelquepart49" , "10 place de quelquepart49" , "0" , "Belgium" ])
        self.accounts.append([ "50" , "test 50 SA" , "test 50" , "aa 50" , "bb 50" , "cc 50" , "dd 50" , "www.quelquechose50.com" , "0621440940" , "0638889615" , "quelquechose50" , "quelquepart50" , "10 place de quelquepart50" , "0" , "Spain" ])
        self.accounts.append([ "51" , "test 51 SA" , "test 51" , "aa 51" , "bb 51" , "cc 51" , "dd 51" , "www.quelquechose51.com" , "0684981131" , "0666442077" , "quelquechose51" , "quelquepart51" , "10 place de quelquepart51" , "0" , "Spain" ])
        self.accounts.append([ "52" , "test 52 SA" , "test 52" , "aa 52" , "bb 52" , "cc 52" , "dd 52" , "www.quelquechose52.com" , "0690377293" , "0678368502" , "quelquechose52" , "quelquepart52" , "10 place de quelquepart52" , "0" , "Belgium" ])
        self.accounts.append([ "53" , "test 53 SA" , "test 53" , "aa 53" , "bb 53" , "cc 53" , "dd 53" , "www.quelquechose53.com" , "0601983197" , "0672632915" , "quelquechose53" , "quelquepart53" , "10 place de quelquepart53" , "0" , "france" ])
        self.accounts.append([ "54" , "test 54 SA" , "test 54" , "aa" , "bb 54" , "cc 54" , "dd 54" , "www.quelquechose54.com" , "0618052139" , "0686838807" , "quelquechose54" , "quelquepart54" , "10 place de quelquepart54" , "0" , "Belgium" ])
    }
    func viderAccounts(){
        self.accounts = [[ "1" , "test 1 SA" , "test 1" , "aa 1" , "bb 1" , "cc 1" , "dd 1" , "www.quelquechose1.com" , "0699048436" , "0603403171" , "quelquechose1" , "quelquepart1" , "10 place de quelquepart1" , "1" , "Belgium" ]]
    }
    func remplirTableauAccount() -> [AccountModel]{
        remplirAccounts()
        var allAccounts = [AccountModel]()
        var account: AccountModel
        for oneAccount in self.accounts{
            var idAccount: Int = oneAccount[0].toInt()!
            var nameAccount: String = oneAccount[01]
            var shortNameAccount: String = oneAccount[02]
            var leadSource: String = oneAccount[03]
            var statusAccount: String = oneAccount[04]
            var industryAccount: String = oneAccount[05]
            var segmentAccount: String = oneAccount[06]
            var websiteAccount: String = oneAccount[07]
            var phoneAccount: String = oneAccount[08]
            var faxAccount: String = oneAccount[09]
            var coverageAccount: String = oneAccount[10]
            var regionAccount: String = oneAccount[11]
            var adressAccount: String = oneAccount[12]
            var idAccount1: Int = oneAccount[13].toInt()!
            var countryAccount: String = oneAccount[14]
            account = AccountModel(idAccount: idAccount, nameAccount: nameAccount, shortNameAccount: shortNameAccount, leadSource: leadSource, statusAccount: statusAccount, industryAccount: industryAccount, segmentAccount: segmentAccount, websiteAccount: websiteAccount, phoneAccount: phoneAccount, faxAccount: faxAccount, coverageAccount: coverageAccount, regionAccount: regionAccount, adressAccount: adressAccount, idAccount1: idAccount1, countryAccount: countryAccount)
            allAccounts.append(account)
        }
        viderAccounts()
        return allAccounts
    }
    func insertingAccounts() {
        var successful = ""
        let accountsToInsert = remplirTableauAccount()
        for accountToInsert in accountsToInsert {
            successful += AccountDataModel().insertAccount(accountToInsert)
            successful += "\n"
        }
        println(successful)
    }
    
    var meetings = [[ "1" , "Subject 1" , "2015-03-22 11:13" , "QuelquePart 1" , "2015-03-22 11:43" , "1" , "Medium" , "description 1" , "regarding 1" , "report 1" ]]
    func remplirMeetings() {
        self.meetings.append([ "2" , "Subject 2" , "2015-09-21 12:22" , "QuelquePart 2" , "2015-09-21 12:52" , "1" , "Low" , "description 2" , "regarding 2" , "report 2" ])
        self.meetings.append([ "3" , "Subject 3" , "2015-07-06 12:12" , "QuelquePart 3" , "2015-07-06 12:42" , "1" , "Low" , "description 3" , "regarding 3" , "report 3" ])
        self.meetings.append([ "4" , "Subject 4" , "2015-02-20 14:25" , "QuelquePart 4" , "2015-02-20 14:55" , "0" , "Medium" , "description 4" , "regarding 4" , "report 4" ])
        self.meetings.append([ "5" , "Subject 5" , "2015-01-21 16:23" , "QuelquePart 5" , "2015-01-21 16:53" , "1" , "High" , "description 5" , "regarding 5" , "report 5" ])
        self.meetings.append([ "6" , "Subject 6" , "2015-05-17 15:28" , "QuelquePart 6" , "2015-05-17 15:58" , "1" , "Medium" , "description 6" , "regarding 6" , "report 6" ])
        self.meetings.append([ "7" , "Subject 7" , "2015-07-21 08:12" , "QuelquePart 7" , "2015-07-21 08:42" , "1" , "Medium" , "description 7" , "regarding 7" , "report 7" ])
        self.meetings.append([ "8" , "Subject 8" , "2015-07-06 10:13" , "QuelquePart 8" , "2015-07-06 10:43" , "1" , "High" , "description 8" , "regarding 8" , "report 8" ])
        self.meetings.append([ "9" , "Subject 9" , "2015-03-11 10:22" , "QuelquePart 9" , "2015-03-11 10:52" , "0" , "High" , "description 9" , "regarding 9" , "report 9" ])
        self.meetings.append([ "10" , "Subject 10" , "2015-03-20 08:17" , "QuelquePart 10" , "2015-03-20 08:47" , "1" , "High" , "description 10" , "regarding 10" , "report 10" ])
        self.meetings.append([ "11" , "Subject 11" , "2015-06-16 08:03" , "QuelquePart 11" , "2015-06-16 08:33" , "1" , "Medium" , "description 11" , "regarding 11" , "report 11" ])
        self.meetings.append([ "12" , "Subject 12" , "2015-05-21 12:15" , "QuelquePart 12" , "2015-05-21 12:45" , "0" , "High" , "description 12" , "regarding 12" , "report 12" ])
        self.meetings.append([ "13" , "Subject 13" , "2015-01-07 10:15" , "QuelquePart 13" , "2015-01-07 10:45" , "0" , "Low" , "description 13" , "regarding 13" , "report 13" ])
        self.meetings.append([ "14" , "Subject 14" , "2015-06-27 12:23" , "QuelquePart 14" , "2015-06-27 12:53" , "0" , "Low" , "description 14" , "regarding 14" , "report 14" ])
        self.meetings.append([ "15" , "Subject 15" , "2015-02-23 09:10" , "QuelquePart 15" , "2015-02-23 09:40" , "0" , "High" , "description 15" , "regarding 15" , "report 15" ])
        self.meetings.append([ "16" , "Subject 16" , "2015-12-20 15:26" , "QuelquePart 16" , "2015-12-20 15:56" , "0" , "High" , "description 16" , "regarding 16" , "report 16" ])
        self.meetings.append([ "17" , "Subject 17" , "2015-08-21 15:07" , "QuelquePart 17" , "2015-08-21 15:37" , "1" , "Medium" , "description 17" , "regarding 17" , "report 17" ])
        self.meetings.append([ "18" , "Subject 18" , "2015-05-03 14:07" , "QuelquePart 18" , "2015-05-03 14:37" , "1" , "Low" , "description 18" , "regarding 18" , "report 18" ])
        self.meetings.append([ "19" , "Subject 19" , "2015-10-24 15:18" , "QuelquePart 19" , "2015-10-24 15:48" , "0" , "Medium" , "description 19" , "regarding 19" , "report 19" ])
        self.meetings.append([ "20" , "Subject 20" , "2015-05-14 10:28" , "QuelquePart 20" , "2015-05-14 10:58" , "1" , "High" , "description 20" , "regarding 20" , "report 20" ])
        self.meetings.append([ "21" , "Subject 21" , "2015-05-08 13:21" , "QuelquePart 21" , "2015-05-08 13:51" , "1" , "Medium" , "description 21" , "regarding 21" , "report 21" ])
        self.meetings.append([ "22" , "Subject 22" , "2015-09-16 10:02" , "QuelquePart 22" , "2015-09-16 10:32" , "1" , "High" , "description 22" , "regarding 22" , "report 22" ])
        self.meetings.append([ "23" , "Subject 23" , "2015-06-23 15:10" , "QuelquePart 23" , "2015-06-23 15:40" , "0" , "Medium" , "description 23" , "regarding 23" , "report 23" ])
        self.meetings.append([ "24" , "Subject 24" , "2015-01-13 10:26" , "QuelquePart 24" , "2015-01-13 10:56" , "1" , "Medium" , "description 24" , "regarding 24" , "report 24" ])
        self.meetings.append([ "25" , "Subject 25" , "2015-07-23 12:13" , "QuelquePart 25" , "2015-07-23 12:43" , "1" , "Medium" , "description 25" , "regarding 25" , "report 25" ])
        self.meetings.append([ "26" , "Subject 26" , "2015-07-12 12:24" , "QuelquePart 26" , "2015-07-12 12:54" , "1" , "Low" , "description 26" , "regarding 26" , "report 26" ])
        self.meetings.append([ "27" , "Subject 27" , "2015-12-08 15:13" , "QuelquePart 27" , "2015-12-08 15:43" , "0" , "Medium" , "description 27" , "regarding 27" , "report 27" ])
        self.meetings.append([ "28" , "Subject 28" , "2015-12-08 12:13" , "QuelquePart 28" , "2015-12-08 12:43" , "0" , "High" , "description 28" , "regarding 28" , "report 28" ])
        self.meetings.append([ "29" , "Subject 29" , "2015-11-28 12:27" , "QuelquePart 29" , "2015-11-28 12:57" , "1" , "Medium" , "description 29" , "regarding 29" , "report 29" ])
        self.meetings.append([ "30" , "Subject 30" , "2015-09-12 09:15" , "QuelquePart 30" , "2015-09-12 09:45" , "0" , "High" , "description 30" , "regarding 30" , "report 30" ])
        self.meetings.append([ "31" , "Subject 31" , "2015-10-15 14:15" , "QuelquePart 31" , "2015-10-15 14:45" , "0" , "Low" , "description 31" , "regarding 31" , "report 31" ])
        self.meetings.append([ "32" , "Subject 32" , "2015-06-11 13:14" , "QuelquePart 32" , "2015-06-11 13:44" , "1" , "High" , "description 32" , "regarding 32" , "report 32" ])
        self.meetings.append([ "33" , "Subject 33" , "2015-10-01 11:01" , "QuelquePart 33" , "2015-10-01 11:31" , "1" , "Medium" , "description 33" , "regarding 33" , "report 33" ])
        self.meetings.append([ "34" , "Subject 34" , "2015-08-16 13:05" , "QuelquePart 34" , "2015-08-16 13:35" , "0" , "Medium" , "description 34" , "regarding 34" , "report 34" ])
        self.meetings.append([ "35" , "Subject 35" , "2015-11-12 14:16" , "QuelquePart 35" , "2015-11-12 14:46" , "0" , "Medium" , "description 35" , "regarding 35" , "report 35" ])
        self.meetings.append([ "36" , "Subject 36" , "2015-11-18 09:01" , "QuelquePart 36" , "2015-11-18 09:31" , "1" , "Low" , "description 36" , "regarding 36" , "report 36" ])
        self.meetings.append([ "37" , "Subject 37" , "2015-06-18 16:25" , "QuelquePart 37" , "2015-06-18 16:55" , "0" , "Low" , "description 37" , "regarding 37" , "report 37" ])
        self.meetings.append([ "38" , "Subject 38" , "2015-02-09 13:05" , "QuelquePart 38" , "2015-02-09 13:35" , "1" , "Medium" , "description 38" , "regarding 38" , "report 38" ])
        self.meetings.append([ "39" , "Subject 39" , "2015-09-16 08:20" , "QuelquePart 39" , "2015-09-16 08:50" , "0" , "Low" , "description 39" , "regarding 39" , "report 39" ])
        self.meetings.append([ "40" , "Subject 40" , "2015-11-16 15:24" , "QuelquePart 40" , "2015-11-16 15:54" , "1" , "High" , "description 40" , "regarding 40" , "report 40" ])
        self.meetings.append([ "41" , "Subject 41" , "2015-12-28 13:07" , "QuelquePart 41" , "2015-12-28 13:37" , "1" , "Medium" , "description 41" , "regarding 41" , "report 41" ])
        self.meetings.append([ "42" , "Subject 42" , "2015-10-26 16:13" , "QuelquePart 42" , "2015-10-26 16:43" , "0" , "High" , "description 42" , "regarding 42" , "report 42" ])
        self.meetings.append([ "43" , "Subject 43" , "2015-02-17 15:03" , "QuelquePart 43" , "2015-02-17 15:33" , "1" , "Low" , "description 43" , "regarding 43" , "report 43" ])
        self.meetings.append([ "44" , "Subject 44" , "2015-07-06 16:29" , "QuelquePart 44" , "2015-07-06 16:59" , "1" , "High" , "description 44" , "regarding 44" , "report 44" ])
        self.meetings.append([ "45" , "Subject 45" , "2015-11-28 16:13" , "QuelquePart 45" , "2015-11-28 16:43" , "1" , "Medium" , "description 45" , "regarding 45" , "report 45" ])
        self.meetings.append([ "46" , "Subject 46" , "2015-03-04 16:06" , "QuelquePart 46" , "2015-03-04 16:36" , "1" , "Low" , "description 46" , "regarding 46" , "report 46" ])
        self.meetings.append([ "47" , "Subject 47" , "2015-03-25 16:06" , "QuelquePart 46" , "2015-03-04 16:36" , "1" , "Low" , "description 46" , "regarding 46" , "report 46" ])
        self.meetings.append([ "48" , "Subject 48" , "2015-03-25 08:06" , "QuelquePart 46" , "2015-03-04 16:36" , "1" , "Low" , "description 46" , "regarding 46" , "report 46" ])
        self.meetings.append([ "49" , "Subject 49" , "2015-03-25 12:06" , "QuelquePart 46" , "2015-03-04 16:36" , "1" , "Low" , "description 46" , "regarding 46" , "report 46" ])
    }
    func viderMeetings() {
        self.meetings = [[ "1" , "Subject 1" , "2015-03-22 11:13" , "QuelquePart 1" , "2015-03-22 11:43" , "1" , "Medium" , "description 1" , "regarding 1" , "report 1" ]]
    }
    func remplirTableauMeetings() -> [MeetingModel] {
        remplirMeetings()
        var meetingsARendre = [MeetingModel]()
        var meet: MeetingModel
        for meeting in self.meetings {
            var idMeeting: Int = meeting[0].toInt()!
            var subjectMeeting = meeting[01]
            var dateBeginMeeting = meeting[02]
            var adressMeeting = meeting[03]
            var dateEndMeeting = meeting[04]
            var allDayMeeting: Int = meeting[05].toInt()!
            var priorityMeeting = meeting[06]
            var descriptionMeeting = meeting[07]
            var regardingMeeting = meeting[08]
            var reportMeeting = meeting[09]
            meet = MeetingModel(idMeeting: idMeeting, subjectMeeting: subjectMeeting, dateBeginMeeting: dateBeginMeeting, adressMeeting: adressMeeting, dateEndMeeting: dateEndMeeting, allDayMeeting: allDayMeeting, priorityMeeting: priorityMeeting, descriptionMeeting: descriptionMeeting, regardingMeeting: regardingMeeting, reportMeeting: reportMeeting)
            meetingsARendre.append(meet)
        }
        viderMeetings()
        return meetingsARendre
    }
    func insertingMeetings() {
        var successful = ""
        let meetingsToInsert = remplirTableauMeetings()
        for meetingToInsert in meetingsToInsert {
            successful += MeetingDataModel().insertMeeting(meetingToInsert)
            successful += "\n"
        }
        println(successful)
    }
    
    var opportunities = [[ "1" , "test nom 1" , "3194247" , "2015-10-23" , "Got it" ]]
    func remplirOpportunities() {
        self.opportunities.append([ "2" , "test nom 2" , "2221037" , "2015-08-16" , "May be" ])
        self.opportunities.append([ "3" , "test nom 3" , "8063510" , "2015-07-01" , "May be" ])
        self.opportunities.append([ "4" , "test nom 4" , "2663360" , "2015-06-20" , "Good" ])
        self.opportunities.append([ "5" , "test nom 5" , "8353155" , "2015-05-21" , "Got it" ])
        self.opportunities.append([ "6" , "test nom 6" , "6485872" , "2015-05-02" , "Good" ])
        self.opportunities.append([ "7" , "test nom 7" , "8135020" , "2015-12-14" , "Got it" ])
        self.opportunities.append([ "8" , "test nom 8" , "6449395" , "2015-08-26" , "Good" ])
        self.opportunities.append([ "9" , "test nom 9" , "6823630" , "2015-10-11" , "May be" ])
        self.opportunities.append([ "10" , "test nom 10" , "9750878" , "2015-05-13" , "Got it" ])
        self.opportunities.append([ "11" , "test nom 11" , "9739484" , "2015-02-08" , "Got it" ])
        self.opportunities.append([ "12" , "test nom 12" , "2568394" , "2015-02-16" , "Good" ])
        self.opportunities.append([ "13" , "test nom 13" , "8934783" , "2015-06-01" , "Good" ])
        self.opportunities.append([ "14" , "test nom 14" , "879077" , "2015-12-27" , "May be" ])
        self.opportunities.append([ "15" , "test nom 15" , "7827800" , "2015-08-11" , "Got it" ])
        self.opportunities.append([ "16" , "test nom 16" , "4281868" , "2015-12-02" , "No" ])
        self.opportunities.append([ "17" , "test nom 17" , "9371268" , "2015-10-03" , "No" ])
        self.opportunities.append([ "18" , "test nom 18" , "9045262" , "2015-10-13" , "May be" ])
        self.opportunities.append([ "19" , "test nom 19" , "5781705" , "2015-12-27" , "Good" ])
        self.opportunities.append([ "20" , "test nom 20" , "9392223" , "2015-10-17" , "Got it" ])
        self.opportunities.append([ "21" , "test nom 21" , "1594370" , "2015-03-08" , "No" ])
        self.opportunities.append([ "22" , "test nom 22" , "1718478" , "2015-08-10" , "Good" ])
        self.opportunities.append([ "23" , "test nom 23" , "3060052" , "2015-01-09" , "Good" ])
        self.opportunities.append([ "24" , "test nom 24" , "3096395" , "2015-10-08" , "Got it" ])
        self.opportunities.append([ "25" , "test nom 25" , "1114449" , "2015-12-17" , "No" ])
        self.opportunities.append([ "26" , "test nom 26" , "2798812" , "2015-03-02" , "Got it" ])
        self.opportunities.append([ "27" , "test nom 27" , "5570843" , "2015-04-23" , "Good" ])
        self.opportunities.append([ "28" , "test nom 28" , "37357" , "2015-09-21" , "Good" ])
        self.opportunities.append([ "29" , "test nom 29" , "5655184" , "2015-07-18" , "No" ])
        self.opportunities.append([ "30" , "test nom 30" , "5427403" , "2015-11-13" , "Got it" ])
        self.opportunities.append([ "31" , "test nom 31" , "6088193" , "2015-10-21" , "May be" ])
        self.opportunities.append([ "32" , "test nom 32" , "7753880" , "2015-09-10" , "Got it" ])
        self.opportunities.append([ "33" , "test nom 33" , "6438933" , "2015-11-27" , "Good" ])
        self.opportunities.append([ "34" , "test nom 34" , "7227538" , "2015-09-27" , "No" ])
        self.opportunities.append([ "35" , "test nom 35" , "6527828" , "2015-02-19" , "Got it" ])
        self.opportunities.append([ "36" , "test nom 36" , "7127675" , "2015-01-19" , "No" ])
        self.opportunities.append([ "37" , "test nom 37" , "9209168" , "2015-04-13" , "Got it" ])
        self.opportunities.append([ "38" , "test nom 38" , "9114577" , "2015-08-28" , "Good" ])
        self.opportunities.append([ "39" , "test nom 39" , "8632115" , "2015-09-28" , "Good" ])
        self.opportunities.append([ "40" , "test nom 40" , "5787584" , "2015-09-13" , "May be" ])
        self.opportunities.append([ "41" , "test nom 41" , "8234059" , "2015-01-22" , "Good" ])
        self.opportunities.append([ "42" , "test nom 42" , "928890" , "2015-05-05" , "No" ])
        self.opportunities.append([ "43" , "test nom 43" , "5680165" , "2015-08-03" , "May be" ])
        self.opportunities.append([ "44" , "test nom 44" , "5379572" , "2015-11-05" , "May be" ])
        self.opportunities.append([ "45" , "test nom 45" , "2465962" , "2015-12-08" , "Good" ])
        self.opportunities.append([ "46" , "test nom 46" , "3349804" , "2015-09-28" , "No" ])
        self.opportunities.append([ "47" , "test nom 47" , "4491888" , "2015-10-14" , "Good" ])
        self.opportunities.append([ "48" , "test nom 48" , "2908736" , "2015-07-22" , "Got it" ])
        self.opportunities.append([ "49" , "test nom 49" , "535145" , "2015-08-17" , "Got it" ])
        self.opportunities.append([ "50" , "test nom 50" , "5986190" , "2015-10-27" , "Got it" ])
        self.opportunities.append([ "51" , "test nom 51" , "8685962" , "2015-06-01" , "Good" ])
        self.opportunities.append([ "52" , "test nom 52" , "6820324" , "2015-10-08" , "Good" ])
        self.opportunities.append([ "53" , "test nom 53" , "5744826" , "2015-05-20" , "Got it" ])
        self.opportunities.append([ "54" , "test nom 54" , "7482423" , "2015-11-06" , "No" ])
    }
    func viderOppportunities(){
        self.opportunities = [[ "1" , "test nom 1" , "3194247" , "2015-10-23" , "Got it" ]]
    }
    func remplirTableauOpportunities() -> [OpportunityModel] {
        remplirOpportunities()
        var opportunitiesARendre = [OpportunityModel]()
        var opportunityModel: OpportunityModel
        for opportunity in self.opportunities {
            var idOpportunite: Int = opportunity[0].toInt()!
            var nomOpportunite: String = opportunity[01]
            var contractValueOpportunite: String = opportunity[02]
            var closeDateOpportunity: String = opportunity[03]
            var statusOpportunity: String = opportunity[4]
            opportunityModel = OpportunityModel(idOpportunite: idOpportunite, nomOpportunite: nomOpportunite, contractValueOpportunite: contractValueOpportunite, closeDateOpportunity: closeDateOpportunity, statusOpportunity: statusOpportunity)
            opportunitiesARendre.append(opportunityModel)
        }
        viderOppportunities()
        return opportunitiesARendre
    }
    func insertingOpportunities() {
        var successful = ""
        let opportunitiesToInsert = remplirTableauOpportunities()
        for opportunityToInsert in opportunitiesToInsert {
            successful += OpportunityDataModel().insertOpportunity(opportunityToInsert)
            successful += "\n"
        }
        println(successful)
    }
    
    var contacts = [[ "1" , "Job Title 1" , "Belgium" , "Mr" , "Prénom 1" , "Nom 1" , "Commercial" , "1940-09-22" , "0667207781" , "0639660225" , "nom.prenom1@account1.com" , "Flamand" , "adress1" , "www.linkedin.com/profile/nom1" , "2" ]]
    func remplirContacts() {
        self.contacts.append([ "2" , "Job Title 2" , "France" , "Mr" , "Prénom 2" , "Nom 2" , "Commercial" , "1981-10-17" , "0607796473" , "0641328654" , "nom.prenom2@account2.com" , "Flamand" , "adress2" , "www.linkedin.com/profile/nom2" , "0" ])
        self.contacts.append([ "3" , "Job Title 3" , "Spain" , "Mme" , "Prénom 3" , "Nom 3" , "Autre" , "1960-01-23" , "0697151402" , "0645056299" , "nom.prenom3@account3.com" , "Français" , "adress3" , "www.linkedin.com/profile/nom3" , "2" ])
        self.contacts.append([ "4" , "Job Title 4" , "Belgium" , "Mrs" , "Prénom 4" , "Nom 4" , "Manager" , "1966-05-18" , "0652708335" , "0622479259" , "nom.prenom4@account4.com" , "Français" , "adress4" , "www.linkedin.com/profile/nom4" , "2" ])
        self.contacts.append([ "5" , "Job Title 5" , "France" , "Mme" , "Prénom 5" , "Nom 5" , "Commercial" , "1971-01-03" , "0644056015" , "0656164428" , "nom.prenom5@account5.com" , "Flamand" , "adress5" , "www.linkedin.com/profile/nom5" , "2" ])
        self.contacts.append([ "6" , "Job Title 6" , "Belgium" , "Mr" , "Prénom 6" , "Nom 6" , "Manager" , "1988-01-02" , "0631853574" , "0675820230" , "nom.prenom6@account6.com" , "Espagnol" , "adress6" , "www.linkedin.com/profile/nom6" , "2" ])
        self.contacts.append([ "7" , "Job Title 7" , "France" , "Mme" , "Prénom 7" , "Nom 7" , "Autre" , "1967-10-18" , "0641394992" , "0692013825" , "nom.prenom7@account7.com" , "Espagnol" , "adress7" , "www.linkedin.com/profile/nom7" , "2" ])
        self.contacts.append([ "8" , "Job Title 8" , "Spain" , "Mr" , "Prénom 8" , "Nom 8" , "Manager" , "1970-03-25" , "0689828779" , "0644043395" , "nom.prenom8@account8.com" , "Espagnol" , "adress8" , "www.linkedin.com/profile/nom8" , "2" ])
        self.contacts.append([ "9" , "Job Title 9" , "Belgium" , "Mme" , "Prénom 9" , "Nom 9" , "Commercial" , "1956-05-07" , "0650522927" , "0672907037" , "nom.prenom9@account9.com" , "Espagnol" , "adress9" , "www.linkedin.com/profile/nom9" , "2" ])
        self.contacts.append([ "10" , "Job Title 10" , "Spain" , "Mr" , "Prénom 10" , "Nom 10" , "Commercial" , "1956-09-09" , "0602592650" , "0692215192" , "nom.prenom10@account10.com" , "Français" , "adress10" , "www.linkedin.com/profile/nom10" , "2" ])
        self.contacts.append([ "11" , "Job Title 11" , "France" , "Mrs" , "Prénom 11" , "Nom 11" , "Manager" , "1952-06-28" , "0681179434" , "0692862479" , "nom.prenom11@account11.com" , "Français" , "adress11" , "www.linkedin.com/profile/nom11" , "2" ])
        self.contacts.append([ "12" , "Job Title 12" , "Belgium" , "Mme" , "Prénom 12" , "Nom 12" , "Autre" , "1980-06-17" , "0690578715" , "0626810355" , "nom.prenom12@account12.com" , "Espagnol" , "adress12" , "www.linkedin.com/profile/nom12" , "2" ])
        self.contacts.append([ "13" , "Job Title 13" , "France" , "Mme" , "Prénom 13" , "Nom 13" , "Autre" , "1990-03-17" , "0691180966" , "0691068737" , "nom.prenom13@account13.com" , "Français" , "adress13" , "www.linkedin.com/profile/nom13" , "2" ])
        self.contacts.append([ "14" , "Job Title 14" , "Belgium" , "Mme" , "Prénom 14" , "Nom 14" , "Autre" , "1978-07-28" , "0634300005" , "0647800978" , "nom.prenom14@account14.com" , "Flamand" , "adress14" , "www.linkedin.com/profile/nom14" , "2" ])
        self.contacts.append([ "15" , "Job Title 15" , "Belgium" , "Mrs" , "Prénom 15" , "Nom 15" , "Autre" , "1980-09-14" , "0691404658" , "0681005097" , "nom.prenom15@account15.com" , "Flamand" , "adress15" , "www.linkedin.com/profile/nom15" , "2" ])
        self.contacts.append([ "16" , "Job Title 16" , "Belgium" , "Mr" , "Prénom 16" , "Nom 16" , "Manager" , "1982-11-25" , "0644759051" , "0654849099" , "nom.prenom16@account16.com" , "Français" , "adress16" , "www.linkedin.com/profile/nom16" , "2" ])
        self.contacts.append([ "17" , "Job Title 17" , "Spain" , "Mrs" , "Prénom 17" , "Nom 17" , "Commercial" , "1942-09-22" , "0612339033" , "0631220781" , "nom.prenom17@account17.com" , "Français" , "adress17" , "www.linkedin.com/profile/nom17" , "2" ])
        self.contacts.append([ "18" , "Job Title 18" , "Spain" , "Mrs" , "Prénom 18" , "Nom 18" , "Autre" , "1955-06-02" , "0629275816" , "0630349383" , "nom.prenom18@account18.com" , "Français" , "adress18" , "www.linkedin.com/profile/nom18" , "2" ])
        self.contacts.append([ "19" , "Job Title 19" , "Belgium" , "Mr" , "Prénom 19" , "Nom 19" , "Commercial" , "1989-09-03" , "0648371332" , "0662222493" , "nom.prenom19@account19.com" , "Espagnol" , "adress19" , "www.linkedin.com/profile/nom19" , "0" ])
        self.contacts.append([ "20" , "Job Title 20" , "Belgium" , "Mr" , "Prénom 20" , "Nom 20" , "Commercial" , "1948-12-01" , "0641053183" , "0634356998" , "nom.prenom20@account20.com" , "Flamand" , "adress20" , "www.linkedin.com/profile/nom20" , "0" ])
        self.contacts.append([ "21" , "Job Title 21" , "France" , "Mme" , "Prénom 21" , "Nom 21" , "Commercial" , "1980-11-10" , "0610327169" , "0670453137" , "nom.prenom21@account21.com" , "Espagnol" , "adress21" , "www.linkedin.com/profile/nom21" , "0" ])
        self.contacts.append([ "22" , "Job Title 22" , "Spain" , "Mrs" , "Prénom 22" , "Nom 22" , "Autre" , "1989-05-01" , "0605992547" , "0673497466" , "nom.prenom22@account22.com" , "Français" , "adress22" , "www.linkedin.com/profile/nom22" , "0" ])
        self.contacts.append([ "23" , "Job Title 23" , "France" , "Mme" , "Prénom 23" , "Nom 23" , "Commercial" , "1975-07-15" , "0628658627" , "0638534652" , "nom.prenom23@account23.com" , "Espagnol" , "adress23" , "www.linkedin.com/profile/nom23" , "5" ])
        self.contacts.append([ "24" , "Job Title 24" , "Belgium" , "Mme" , "Prénom 24" , "Nom 24" , "Manager" , "1953-12-15" , "0623406203" , "0633740381" , "nom.prenom24@account24.com" , "Français" , "adress24" , "www.linkedin.com/profile/nom24" , "5" ])
        self.contacts.append([ "25" , "Job Title 25" , "Belgium" , "Mrs" , "Prénom 25" , "Nom 25" , "Autre" , "1982-12-22" , "0692768991" , "0612636751" , "nom.prenom25@account25.com" , "Flamand" , "adress25" , "www.linkedin.com/profile/nom25" , "5" ])
        self.contacts.append([ "26" , "Job Title 26" , "France" , "Mrs" , "Prénom 26" , "Nom 26" , "Commercial" , "1983-03-07" , "0631174577" , "0694834789" , "nom.prenom26@account26.com" , "Français" , "adress26" , "www.linkedin.com/profile/nom26" , "5" ])
        self.contacts.append([ "27" , "Job Title 27" , "Spain" , "Mrs" , "Prénom 27" , "Nom 27" , "Commercial" , "1979-08-20" , "0686090312" , "0664360846" , "nom.prenom27@account27.com" , "Flamand" , "adress27" , "www.linkedin.com/profile/nom27" , "5" ])
        self.contacts.append([ "28" , "Job Title 28" , "Belgium" , "Mrs" , "Prénom 28" , "Nom 28" , "Commercial" , "1954-02-27" , "0650076251" , "0601194968" , "nom.prenom28@account28.com" , "Flamand" , "adress28" , "www.linkedin.com/profile/nom28" , "5" ])
        self.contacts.append([ "29" , "Job Title 29" , "France" , "Mr" , "Prénom 29" , "Nom 29" , "Commercial" , "1964-02-23" , "0678970664" , "0644222651" , "nom.prenom29@account29.com" , "Espagnol" , "adress29" , "www.linkedin.com/profile/nom29" , "0" ])
        self.contacts.append([ "30" , "Job Title 30" , "Spain" , "Mr" , "Prénom 30" , "Nom 30" , "Commercial" , "1954-01-12" , "0628026919" , "0692147362" , "nom.prenom30@account30.com" , "Espagnol" , "adress30" , "www.linkedin.com/profile/nom30" , "0" ])
        self.contacts.append([ "31" , "Job Title 31" , "Belgium" , "Mrs" , "Prénom 31" , "Nom 31" , "Manager" , "1962-03-01" , "0621147842" , "0618209541" , "nom.prenom31@account31.com" , "Français" , "adress31" , "www.linkedin.com/profile/nom31" , "0" ])
        self.contacts.append([ "32" , "Job Title 32" , "Spain" , "Mrs" , "Prénom 32" , "Nom 32" , "Autre" , "1990-09-20" , "0637476585" , "0640176516" , "nom.prenom32@account32.com" , "Français" , "adress32" , "www.linkedin.com/profile/nom32" , "0" ])
        self.contacts.append([ "33" , "Job Title 33" , "Belgium" , "Mrs" , "Prénom 33" , "Nom 33" , "Commercial" , "1971-05-26" , "0683101418" , "0686790017" , "nom.prenom33@account33.com" , "Français" , "adress33" , "www.linkedin.com/profile/nom33" , "18" ])
        self.contacts.append([ "34" , "Job Title 34" , "Belgium" , "Mme" , "Prénom 34" , "Nom 34" , "Autre" , "1945-05-05" , "0636487068" , "0650405820" , "nom.prenom34@account34.com" , "Français" , "adress34" , "www.linkedin.com/profile/nom34" , "18" ])
        self.contacts.append([ "35" , "Job Title 35" , "France" , "Mrs" , "Prénom 35" , "Nom 35" , "Manager" , "1953-03-11" , "0682665692" , "0613316568" , "nom.prenom35@account35.com" , "Flamand" , "adress35" , "www.linkedin.com/profile/nom35" , "18" ])
        self.contacts.append([ "36" , "Job Title 36" , "Belgium" , "Mme" , "Prénom 36" , "Nom 36" , "Commercial" , "1953-12-25" , "0639973978" , "0661930839" , "nom.prenom36@account36.com" , "Espagnol" , "adress36" , "www.linkedin.com/profile/nom36" , "18" ])
        self.contacts.append([ "37" , "Job Title 37" , "Belgium" , "Mme" , "Prénom 37" , "Nom 37" , "Commercial" , "1981-03-07" , "0682373925" , "0672558195" , "nom.prenom37@account37.com" , "Français" , "adress37" , "www.linkedin.com/profile/nom37" , "18" ])
        self.contacts.append([ "38" , "Job Title 38" , "Belgium" , "Mrs" , "Prénom 38" , "Nom 38" , "Autre" , "1965-05-01" , "0676731527" , "0601607188" , "nom.prenom38@account38.com" , "Flamand" , "adress38" , "www.linkedin.com/profile/nom38" , "18" ])
        self.contacts.append([ "39" , "Job Title 39" , "France" , "Mr" , "Prénom 39" , "Nom 39" , "Autre" , "1947-10-22" , "0641059038" , "0666300509" , "nom.prenom39@account39.com" , "Flamand" , "adress39" , "www.linkedin.com/profile/nom39" , "18" ])
        self.contacts.append([ "40" , "Job Title 40" , "France" , "Mrs" , "Prénom 40" , "Nom 40" , "Autre" , "1963-04-02" , "0617577910" , "0654032283" , "nom.prenom40@account40.com" , "Flamand" , "adress40" , "www.linkedin.com/profile/nom40" , "18" ])
        self.contacts.append([ "41" , "Job Title 41" , "Spain" , "Mrs" , "Prénom 41" , "Nom 41" , "Manager" , "1982-10-09" , "0609922974" , "0632330582" , "nom.prenom41@account41.com" , "Flamand" , "adress41" , "www.linkedin.com/profile/nom41" , "18" ])
        self.contacts.append([ "42" , "Job Title 42" , "Spain" , "Mme" , "Prénom 42" , "Nom 42" , "Autre" , "1975-05-02" , "0605699661" , "0693378610" , "nom.prenom42@account42.com" , "Flamand" , "adress42" , "www.linkedin.com/profile/nom42" , "18" ])
        self.contacts.append([ "43" , "Job Title 43" , "France" , "Mme" , "Prénom 43" , "Nom 43" , "Commercial" , "1989-03-02" , "0660137196" , "0618617372" , "nom.prenom43@account43.com" , "Espagnol" , "adress43" , "www.linkedin.com/profile/nom43" , "18" ])
        self.contacts.append([ "44" , "Job Title 44" , "France" , "Mr" , "Prénom 44" , "Nom 44" , "Manager" , "1941-11-18" , "0665085008" , "0654448349" , "nom.prenom44@account44.com" , "Français" , "adress44" , "www.linkedin.com/profile/nom44" , "18" ])
        self.contacts.append([ "45" , "Job Title 45" , "Belgium" , "Mme" , "Prénom 45" , "Nom 45" , "Commercial" , "1942-08-09" , "0694989481" , "0607268837" , "nom.prenom45@account45.com" , "Espagnol" , "adress45" , "www.linkedin.com/profile/nom45" , "18" ])
        self.contacts.append([ "46" , "Job Title 46" , "France" , "Mr" , "Prénom 46" , "Nom 46" , "Manager" , "1986-11-20" , "0611438749" , "0619581915" , "nom.prenom46@account46.com" , "Espagnol" , "adress46" , "www.linkedin.com/profile/nom46" , "18" ])
        self.contacts.append([ "47" , "Job Title 47" , "France" , "Mrs" , "Prénom 47" , "Nom 47" , "Manager" , "1976-06-04" , "0637364909" , "0696838390" , "nom.prenom47@account47.com" , "Français" , "adress47" , "www.linkedin.com/profile/nom47" , "18" ])
        self.contacts.append([ "48" , "Job Title 48" , "France" , "Mme" , "Prénom 48" , "Nom 48" , "Autre" , "1941-12-19" , "0681118241" , "0671771618" , "nom.prenom48@account48.com" , "Espagnol" , "adress48" , "www.linkedin.com/profile/nom48" , "18" ])
        self.contacts.append([ "49" , "Job Title 49" , "Spain" , "Mr" , "Prénom 49" , "Nom 49" , "Commercial" , "1985-02-20" , "0641449620" , "0658487042" , "nom.prenom49@account49.com" , "Espagnol" , "adress49" , "www.linkedin.com/profile/nom49" , "18" ])
        self.contacts.append([ "50" , "Job Title 50" , "Belgium" , "Mrs" , "Prénom 50" , "Nom 50" , "Manager" , "1964-10-02" , "0642680552" , "0663112915" , "nom.prenom50@account50.com" , "Espagnol" , "adress50" , "www.linkedin.com/profile/nom50" , "18" ])
        self.contacts.append([ "51" , "Job Title 51" , "Spain" , "Mr" , "Prénom 51" , "Nom 51" , "Autre" , "1966-12-20" , "0689569699" , "0646460428" , "nom.prenom51@account51.com" , "Flamand" , "adress51" , "www.linkedin.com/profile/nom51" , "18" ])
        self.contacts.append([ "52" , "Job Title 52" , "France" , "Mme" , "Prénom 52" , "Nom 52" , "Manager" , "1983-06-02" , "0640057590" , "0601951662" , "nom.prenom52@account52.com" , "Français" , "adress52" , "www.linkedin.com/profile/nom52" , "18" ])
        self.contacts.append([ "53" , "Job Title 53" , "Belgium" , "Mr" , "Prénom 53" , "Nom 53" , "Manager" , "1983-08-10" , "0690261682" , "0686990599" , "nom.prenom53@account53.com" , "Français" , "adress53" , "www.linkedin.com/profile/nom53" , "18" ])
        self.contacts.append([ "54" , "Job Title 54" , "France" , "Mr" , "Prénom 54" , "Nom 54" , "Autre" , "1966-03-04" , "0688970338" , "0697403018" , "nom.prenom54@account54.com" , "Français" , "adress54" , "www.linkedin.com/profile/nom54" , "18" ])
    }
    func viderContacts(){
        self.contacts = [[ "1" , "Job Title 1" , "Belgium" , "Mr" , "Prénom 1" , "Nom 1" , "Commercial" , "1940-09-22" , "0667207781" , "0639660225" , "nom.prenom1@account1.com" , "Flamand" , "adress1" , "www.linkedin.com/profile/nom1" , "2" ]]
    }
    func remplirTableauContacts() -> [ContactModel] {
        remplirContacts()
        var contactsARendre = [ContactModel]()
        var contactModel: ContactModel
        for contact in contacts {
            var idContact: Int = contact[0].toInt()!
            var jobTitleContact: String = contact[01]
            var countryContact: String = contact[02]
            var civilityContact: String = contact[03]
            var firstNameContact: String = contact[04]
            var lastNameContact: String = contact[05]
            var typeContact: String = contact[06]
            var birthdateContact: String = contact[07]
            var phoneBusinessContact: String = contact[08]
            var phoneMobileContact: String = contact[09]
            var emailContact: String = contact[10]
            var preferredLanguageContact: String = contact[11]
            var workingAdressContact: String = contact[12]
            var linkedinProfileContact: String = contact[13]
            var idContact1: Int = contact[14].toInt()!
            contactModel = ContactModel(idContact: idContact, jobTitleContact: jobTitleContact, countryContact: countryContact, civilityContact: civilityContact, firstNameContact: firstNameContact, lastNameContact: lastNameContact, typeContact: typeContact, birthdateContact: birthdateContact, phoneBusinessContact: phoneBusinessContact, phoneMobileContact: phoneMobileContact, emailContact: emailContact, preferredLanguageContact: preferredLanguageContact, workingAdressContact: workingAdressContact, linkedinProfileContact: linkedinProfileContact, idContact1: idContact1)
            contactsARendre.append(contactModel)
        }
        viderContacts()
        return contactsARendre
    }
    func insertingContacts() {
        var successful = ""
        let contactsToInsert = remplirTableauContacts()
        for contactToInsert in contactsToInsert {
            successful += ContactDataModel().insertContact(contactToInsert)
            successful += "\n"
        }
        println(successful)
    }
    
    var accountContacts = [[ "15" , "2" , "role de contact 2 dans account 15" ]]
    func remplirAccountContacts() {
        self.accountContacts.append([ "24" , "8" , "role de contact 8 dans account 24" ])
        self.accountContacts.append([ "1" , "21" , "role de contact 21 dans account 1" ])
        self.accountContacts.append([ "35" , "34" , "role de contact 34 dans account 35" ])
        self.accountContacts.append([ "30" , "21" , "role de contact 21 dans account 30" ])
        self.accountContacts.append([ "8" , "39" , "role de contact 39 dans account 8" ])
        self.accountContacts.append([ "22" , "19" , "role de contact 19 dans account 22" ])
        self.accountContacts.append([ "23" , "27" , "role de contact 27 dans account 23" ])
        self.accountContacts.append([ "9" , "19" , "role de contact 19 dans account 9" ])
        self.accountContacts.append([ "9" , "10" , "role de contact 10 dans account 9" ])
        self.accountContacts.append([ "39" , "2" , "role de contact 2 dans account 39" ])
        self.accountContacts.append([ "1" , "22" , "role de contact 22 dans account 1" ])
        self.accountContacts.append([ "27" , "34" , "role de contact 34 dans account 27" ])
        self.accountContacts.append([ "23" , "2" , "role de contact 2 dans account 23" ])
        self.accountContacts.append([ "25" , "18" , "role de contact 18 dans account 25" ])
        self.accountContacts.append([ "35" , "15" , "role de contact 15 dans account 35" ])
        self.accountContacts.append([ "36" , "7" , "role de contact 7 dans account 36" ])
        self.accountContacts.append([ "3" , "21" , "role de contact 21 dans account 3" ])
        self.accountContacts.append([ "21" , "7" , "role de contact 7 dans account 21" ])
        self.accountContacts.append([ "3" , "13" , "role de contact 13 dans account 3" ])
        self.accountContacts.append([ "25" , "10" , "role de contact 10 dans account 25" ])
        self.accountContacts.append([ "12" , "35" , "role de contact 35 dans account 12" ])
        self.accountContacts.append([ "13" , "11" , "role de contact 11 dans account 13" ])
        self.accountContacts.append([ "14" , "16" , "role de contact 16 dans account 14" ])
        self.accountContacts.append([ "35" , "14" , "role de contact 14 dans account 35" ])
        self.accountContacts.append([ "37" , "31" , "role de contact 31 dans account 37" ])
        self.accountContacts.append([ "28" , "39" , "role de contact 39 dans account 28" ])
        self.accountContacts.append([ "22" , "12" , "role de contact 12 dans account 22" ])
        self.accountContacts.append([ "2" , "19" , "role de contact 19 dans account 2" ])
        self.accountContacts.append([ "18" , "12" , "role de contact 12 dans account 18" ])
        self.accountContacts.append([ "14" , "13" , "role de contact 13 dans account 14" ])
        self.accountContacts.append([ "33" , "35" , "role de contact 35 dans account 33" ])
        self.accountContacts.append([ "3" , "19" , "role de contact 19 dans account 3" ])
        self.accountContacts.append([ "12" , "32" , "role de contact 32 dans account 12" ])
        self.accountContacts.append([ "39" , "18" , "role de contact 18 dans account 39" ])
        self.accountContacts.append([ "24" , "9" , "role de contact 9 dans account 24" ])
        self.accountContacts.append([ "31" , "31" , "role de contact 31 dans account 31" ])
        self.accountContacts.append([ "9" , "35" , "role de contact 35 dans account 9" ])
        self.accountContacts.append([ "14" , "2" , "role de contact 2 dans account 14" ])
        self.accountContacts.append([ "30" , "19" , "role de contact 19 dans account 30" ])
        self.accountContacts.append([ "38" , "15" , "role de contact 15 dans account 38" ])
        self.accountContacts.append([ "29" , "21" , "role de contact 21 dans account 29" ])
        self.accountContacts.append([ "29" , "9" , "role de contact 9 dans account 29" ])
        self.accountContacts.append([ "10" , "28" , "role de contact 28 dans account 10" ])
        self.accountContacts.append([ "34" , "18" , "role de contact 18 dans account 34" ])
        self.accountContacts.append([ "23" , "37" , "role de contact 37 dans account 23" ])
        self.accountContacts.append([ "32" , "5" , "role de contact 5 dans account 32" ])
        self.accountContacts.append([ "25" , "37" , "role de contact 37 dans account 25" ])
        self.accountContacts.append([ "33" , "34" , "role de contact 34 dans account 33" ])
        self.accountContacts.append([ "7" , "3" , "role de contact 3 dans account 7" ])
        self.accountContacts.append([ "5" , "25" , "role de contact 25 dans account 5" ])
        self.accountContacts.append([ "3" , "10" , "role de contact 10 dans account 3" ])
        self.accountContacts.append([ "27" , "4" , "role de contact 4 dans account 27" ])
        self.accountContacts.append([ "38" , "29" , "role de contact 29 dans account 38" ])
    }
    func viderAccountContacts() {
        self.accountContacts = [[ "15" , "2" , "role de contact 2 dans account 15" ]]
    }
    func remplirTableauAccountContacts() -> [AccountContactModel] {
        remplirAccountContacts()
        var accountContactARendre = [AccountContactModel]()
        var accountContactModel: AccountContactModel
        for accountContact in accountContacts {
            var idAccount: Int = accountContact[0].toInt()!
            var idContact: Int = accountContact[01].toInt()!
            var roleContact: String = accountContact[01]
            accountContactModel = AccountContactModel(idAccount: idAccount, idContact: idContact, roleContact: roleContact)
            accountContactARendre.append(accountContactModel)
        }
        viderAccountContacts()
        return accountContactARendre
    }
    func insertingAccountContacts() {
        var successful = ""
        let accountContactsToInsert = remplirTableauAccountContacts()
        for accountContactToInsert in accountContactsToInsert {
            successful += AccountContactDataModel().insertAccountContact(accountContactToInsert)
            successful += "\n"
        }
        println(successful)
    }
    
    var contactOpportunities = [[ "13" , "26" ]]
    func remplirContactOpportunities() {
        self.contactOpportunities.append([ "38" , "16" ])
        self.contactOpportunities.append([ "18" , "18" ])
        self.contactOpportunities.append([ "5" , "28" ])
        self.contactOpportunities.append([ "35" , "34" ])
        self.contactOpportunities.append([ "14" , "36" ])
        self.contactOpportunities.append([ "15" , "33" ])
        self.contactOpportunities.append([ "8" , "33" ])
        self.contactOpportunities.append([ "11" , "33" ])
        self.contactOpportunities.append([ "20" , "11" ])
        self.contactOpportunities.append([ "25" , "38" ])
        self.contactOpportunities.append([ "27" , "4" ])
        self.contactOpportunities.append([ "11" , "31" ])
        self.contactOpportunities.append([ "30" , "1" ])
        self.contactOpportunities.append([ "31" , "11" ])
        self.contactOpportunities.append([ "5" , "8" ])
        self.contactOpportunities.append([ "18" , "25" ])
        self.contactOpportunities.append([ "19" , "19" ])
        self.contactOpportunities.append([ "5" , "38" ])
        self.contactOpportunities.append([ "15" , "20" ])
        self.contactOpportunities.append([ "13" , "17" ])
        self.contactOpportunities.append([ "28" , "20" ])
        self.contactOpportunities.append([ "10" , "39" ])
        self.contactOpportunities.append([ "28" , "7" ])
        self.contactOpportunities.append([ "31" , "34" ])
        self.contactOpportunities.append([ "31" , "25" ])
        self.contactOpportunities.append([ "28" , "17" ])
        self.contactOpportunities.append([ "15" , "24" ])
        self.contactOpportunities.append([ "3" , "3" ])
        self.contactOpportunities.append([ "18" , "11" ])
        self.contactOpportunities.append([ "31" , "10" ])
        self.contactOpportunities.append([ "22" , "14" ])
        self.contactOpportunities.append([ "20" , "15" ])
        self.contactOpportunities.append([ "27" , "11" ])
        self.contactOpportunities.append([ "33" , "17" ])
        self.contactOpportunities.append([ "38" , "17" ])
        self.contactOpportunities.append([ "12" , "22" ])
        self.contactOpportunities.append([ "28" , "15" ])
        self.contactOpportunities.append([ "36" , "21" ])
        self.contactOpportunities.append([ "8" , "7" ])
        self.contactOpportunities.append([ "7" , "15" ])
        self.contactOpportunities.append([ "33" , "35" ])
        self.contactOpportunities.append([ "25" , "24" ])
        self.contactOpportunities.append([ "15" , "13" ])
        self.contactOpportunities.append([ "38" , "31" ])
        self.contactOpportunities.append([ "24" , "37" ])
        self.contactOpportunities.append([ "20" , "21" ])
        self.contactOpportunities.append([ "21" , "7" ])
        self.contactOpportunities.append([ "9" , "26" ])
        self.contactOpportunities.append([ "27" , "6" ])
        self.contactOpportunities.append([ "18" , "9" ])
        self.contactOpportunities.append([ "32" , "15" ])
        self.contactOpportunities.append([ "12" , "20" ])
        self.contactOpportunities.append([ "40" , "26" ])
    }
    func viderContactOpportunities() {
        self.contactOpportunities = [[ "13" , "26" ]]
    }
    func remplirTableauContactOpportunities() -> [OpportunitiesContactsModel] {
        remplirContactOpportunities()
        var contactOpportunitiesARendre = [OpportunitiesContactsModel]()
        var contactOpportunitiesModel: OpportunitiesContactsModel
        for contactOpportunity in contactOpportunities {
            var idContact: Int = contactOpportunity[0].toInt()!
            var idOpportunite: Int = contactOpportunity[01].toInt()!
            contactOpportunitiesModel = OpportunitiesContactsModel(idContact: idContact, idOpportunite: idOpportunite)
            contactOpportunitiesARendre.append(contactOpportunitiesModel)
        }
        viderContactOpportunities()
        return contactOpportunitiesARendre
    }
    func insertingContactOpportunities() {
        var successful = ""
        let contactOpportunitiesToInsert = remplirTableauContactOpportunities()
        for contactOpportunityToInsert in contactOpportunitiesToInsert {
            successful += OpportunitiesContactsDataModel().insertOpportunitiesContacts(contactOpportunityToInsert)
            successful += "\n"
        }
        println(successful)
    }
    
    var accountOpportunities = [[ "27" , "39" ]]
    func remplirAccountOpportunities() {
        self.accountOpportunities.append([ "12" , "22" ])
        self.accountOpportunities.append([ "10" , "23" ])
        self.accountOpportunities.append([ "5" , "24" ])
        self.accountOpportunities.append([ "35" , "26" ])
        self.accountOpportunities.append([ "24" , "21" ])
        self.accountOpportunities.append([ "23" , "15" ])
        self.accountOpportunities.append([ "1" , "40" ])
        self.accountOpportunities.append([ "6" , "21" ])
        self.accountOpportunities.append([ "32" , "37" ])
        self.accountOpportunities.append([ "19" , "40" ])
        self.accountOpportunities.append([ "11" , "35" ])
        self.accountOpportunities.append([ "15" , "34" ])
        self.accountOpportunities.append([ "14" , "16" ])
        self.accountOpportunities.append([ "11" , "40" ])
        self.accountOpportunities.append([ "32" , "21" ])
        self.accountOpportunities.append([ "17" , "1" ])
        self.accountOpportunities.append([ "37" , "23" ])
        self.accountOpportunities.append([ "19" , "5" ])
        self.accountOpportunities.append([ "36" , "6" ])
        self.accountOpportunities.append([ "34" , "12" ])
        self.accountOpportunities.append([ "23" , "26" ])
        self.accountOpportunities.append([ "29" , "16" ])
        self.accountOpportunities.append([ "26" , "7" ])
        self.accountOpportunities.append([ "28" , "12" ])
        self.accountOpportunities.append([ "18" , "2" ])
        self.accountOpportunities.append([ "22" , "20" ])
        self.accountOpportunities.append([ "36" , "35" ])
        self.accountOpportunities.append([ "26" , "4" ])
        self.accountOpportunities.append([ "3" , "9" ])
        self.accountOpportunities.append([ "26" , "25" ])
        self.accountOpportunities.append([ "2" , "20" ])
        self.accountOpportunities.append([ "12" , "33" ])
        self.accountOpportunities.append([ "14" , "23" ])
        self.accountOpportunities.append([ "1" , "3" ])
        self.accountOpportunities.append([ "9" , "6" ])
        self.accountOpportunities.append([ "33" , "34" ])
        self.accountOpportunities.append([ "35" , "37" ])
        self.accountOpportunities.append([ "38" , "4" ])
        self.accountOpportunities.append([ "37" , "31" ])
        self.accountOpportunities.append([ "26" , "15" ])
        self.accountOpportunities.append([ "28" , "30" ])
        self.accountOpportunities.append([ "25" , "19" ])
        self.accountOpportunities.append([ "14" , "18" ])
        self.accountOpportunities.append([ "16" , "32" ])
        self.accountOpportunities.append([ "20" , "26" ])
        self.accountOpportunities.append([ "30" , "25" ])
        self.accountOpportunities.append([ "19" , "19" ])
        self.accountOpportunities.append([ "21" , "8" ])
        self.accountOpportunities.append([ "39" , "27" ])
        self.accountOpportunities.append([ "37" , "1" ])
        self.accountOpportunities.append([ "27" , "20" ])
        self.accountOpportunities.append([ "31" , "19" ])
        self.accountOpportunities.append([ "2" , "3" ])
    }
    func viderAccountOpportunities() {
        self.accountOpportunities = [[ "27" , "39" ]]
    }
    func remplirTableauAccountOpportunities() -> [AccountOpportunitiesModel] {
        remplirAccountOpportunities()
        var accountOpportunitiesARendre = [AccountOpportunitiesModel]()
        var accountOpportunitiesModel: AccountOpportunitiesModel
        for accountOpportunity in accountOpportunities {
            var idAccount: Int = accountOpportunity[0].toInt()!
            var idOpportunite: Int = accountOpportunity[01].toInt()!
            accountOpportunitiesModel = AccountOpportunitiesModel(idAccount: idAccount, idOpportunite: idOpportunite)
            accountOpportunitiesARendre.append(accountOpportunitiesModel)
        }
        viderAccountOpportunities()
        return accountOpportunitiesARendre
    }
    func insertingAccountOpportunities() {
        var successful = ""
        let accountOpportunitiesToInsert = remplirTableauAccountOpportunities()
        for accountOpportunityToInsert in accountOpportunitiesToInsert {
            successful += AccountOpportunitiesDataModel().insertAccountOpportunities(accountOpportunityToInsert)
            successful += "\n"
        }
        println(successful)
    }
    
    var contactMeetings = [[ "35" , "29" ]]
    func remplirContactMeetings() {
        self.contactMeetings.append([ "21" , "18" ])
        self.contactMeetings.append([ "14" , "24" ])
        self.contactMeetings.append([ "17" , "8" ])
        self.contactMeetings.append([ "38" , "6" ])
        self.contactMeetings.append([ "36" , "31" ])
        self.contactMeetings.append([ "32" , "20" ])
        self.contactMeetings.append([ "28" , "25" ])
        self.contactMeetings.append([ "1" , "21" ])
        self.contactMeetings.append([ "5" , "24" ])
        self.contactMeetings.append([ "1" , "6" ])
        self.contactMeetings.append([ "39" , "38" ])
        self.contactMeetings.append([ "21" , "38" ])
        self.contactMeetings.append([ "20" , "26" ])
        self.contactMeetings.append([ "25" , "3" ])
        self.contactMeetings.append([ "32" , "23" ])
        self.contactMeetings.append([ "8" , "5" ])
        self.contactMeetings.append([ "9" , "30" ])
        self.contactMeetings.append([ "7" , "22" ])
        self.contactMeetings.append([ "17" , "10" ])
        self.contactMeetings.append([ "3" , "23" ])
        self.contactMeetings.append([ "32" , "1" ])
        self.contactMeetings.append([ "8" , "11" ])
        self.contactMeetings.append([ "27" , "14" ])
        self.contactMeetings.append([ "35" , "16" ])
        self.contactMeetings.append([ "19" , "18" ])
        self.contactMeetings.append([ "21" , "20" ])
        self.contactMeetings.append([ "26" , "32" ])
        self.contactMeetings.append([ "15" , "23" ])
        self.contactMeetings.append([ "6" , "11" ])
        self.contactMeetings.append([ "19" , "9" ])
        self.contactMeetings.append([ "29" , "16" ])
        self.contactMeetings.append([ "25" , "8" ])
        self.contactMeetings.append([ "32" , "17" ])
        self.contactMeetings.append([ "36" , "27" ])
        self.contactMeetings.append([ "30" , "19" ])
        self.contactMeetings.append([ "15" , "8" ])
        self.contactMeetings.append([ "1" , "19" ])
        self.contactMeetings.append([ "19" , "34" ])
        self.contactMeetings.append([ "20" , "19" ])
        self.contactMeetings.append([ "25" , "21" ])
        self.contactMeetings.append([ "30" , "22" ])
        self.contactMeetings.append([ "39" , "2" ])
        self.contactMeetings.append([ "17" , "33" ])
        self.contactMeetings.append([ "4" , "25" ])
        self.contactMeetings.append([ "40" , "13" ])
        self.contactMeetings.append([ "28" , "16" ])
        self.contactMeetings.append([ "4" , "4" ])
        self.contactMeetings.append([ "14" , "17" ])
        self.contactMeetings.append([ "21" , "14" ])
        self.contactMeetings.append([ "7" , "23" ])
        self.contactMeetings.append([ "27" , "21" ])
        self.contactMeetings.append([ "24" , "33" ])
        self.contactMeetings.append([ "15" , "1" ])
    }
    func viderContactMeetings() {
        self.contactMeetings = [[ "35" , "29" ]]
    }
    func remplirTableauContactMeetings() -> [MeetingContactModel] {
        remplirContactMeetings()
        var contactMeetingsARendre = [MeetingContactModel]()
        var contactMeetingsModel: MeetingContactModel
        for contactMeeting in contactMeetings {
            var idContact: Int = contactMeeting[0].toInt()!
            var idMeeting: Int = contactMeeting[01].toInt()!
            contactMeetingsModel = MeetingContactModel(idContact: idContact, idMeeting: idMeeting)
            contactMeetingsARendre.append(contactMeetingsModel)
        }
        viderContactMeetings()
        return contactMeetingsARendre
    }
    func insertingContactMeetings() {
        var successful = ""
        let contactMeetingsToInsert = remplirTableauContactMeetings()
        for contactMeetingToInsert in contactMeetingsToInsert {
            successful += MeetingContactDataModel().insertMeetingContactModel(contactMeetingToInsert)
            successful += "\n"
        }
        println(successful)
    }

    var contracts = [[ "1" , "sujet contrat 1" , "9397866" , "2015-08-20" , "Got it" ]]
    func remplirContracts() {
        self.contracts.append([ "2" , "sujet contrat 2" , "7094734" , "2015-12-06" , "Got it" ])
        self.contracts.append([ "3" , "sujet contrat 3" , "2963299" , "2015-02-10" , "May be" ])
        self.contracts.append([ "4" , "sujet contrat 4" , "1541837" , "2015-09-19" , "May be" ])
        self.contracts.append([ "5" , "sujet contrat 5" , "127589" , "2015-04-15" , "Got it" ])
        self.contracts.append([ "6" , "sujet contrat 6" , "940918" , "2015-05-26" , "Good" ])
        self.contracts.append([ "7" , "sujet contrat 7" , "5168389" , "2015-10-01" , "May be" ])
        self.contracts.append([ "8" , "sujet contrat 8" , "6944712" , "2015-03-20" , "Got it" ])
        self.contracts.append([ "9" , "sujet contrat 9" , "1812589" , "2015-08-28" , "No" ])
        self.contracts.append([ "10" , "sujet contrat 10" , "3195183" , "2015-07-23" , "May be" ])
        self.contracts.append([ "11" , "sujet contrat 11" , "9194270" , "2015-05-07" , "Got it" ])
        self.contracts.append([ "12" , "sujet contrat 12" , "1517304" , "2015-11-02" , "Good" ])
        self.contracts.append([ "13" , "sujet contrat 13" , "8742348" , "2015-12-04" , "No" ])
        self.contracts.append([ "14" , "sujet contrat 14" , "5983032" , "2015-03-06" , "Got it" ])
        self.contracts.append([ "15" , "sujet contrat 15" , "7300249" , "2015-07-22" , "Got it" ])
        self.contracts.append([ "16" , "sujet contrat 16" , "5119452" , "2015-08-26" , "No" ])
        self.contracts.append([ "17" , "sujet contrat 17" , "735624" , "2015-11-01" , "Good" ])
        self.contracts.append([ "18" , "sujet contrat 18" , "19587" , "2015-09-06" , "Good" ])
        self.contracts.append([ "19" , "sujet contrat 19" , "7042201" , "2015-10-13" , "May be" ])
        self.contracts.append([ "20" , "sujet contrat 20" , "9169678" , "2015-08-26" , "No" ])
        self.contracts.append([ "21" , "sujet contrat 21" , "636411" , "2015-12-01" , "No" ])
        self.contracts.append([ "22" , "sujet contrat 22" , "1434134" , "2015-11-04" , "No" ])
        self.contracts.append([ "23" , "sujet contrat 23" , "2668957" , "2015-05-18" , "No" ])
        self.contracts.append([ "24" , "sujet contrat 24" , "7383345" , "2015-04-02" , "Good" ])
        self.contracts.append([ "25" , "sujet contrat 25" , "3587355" , "2015-03-26" , "Good" ])
        self.contracts.append([ "26" , "sujet contrat 26" , "6864999" , "2015-11-07" , "Good" ])
        self.contracts.append([ "27" , "sujet contrat 27" , "4165289" , "2015-03-13" , "Good" ])
        self.contracts.append([ "28" , "sujet contrat 28" , "984920" , "2015-05-20" , "May be" ])
        self.contracts.append([ "29" , "sujet contrat 29" , "7404381" , "2015-02-05" , "May be" ])
        self.contracts.append([ "30" , "sujet contrat 30" , "7143832" , "2015-01-11" , "No" ])
        self.contracts.append([ "31" , "sujet contrat 31" , "8212143" , "2015-02-02" , "No" ])
        self.contracts.append([ "32" , "sujet contrat 32" , "970141" , "2015-08-20" , "No" ])
        self.contracts.append([ "33" , "sujet contrat 33" , "5575376" , "2015-10-03" , "Good" ])
        self.contracts.append([ "34" , "sujet contrat 34" , "2585870" , "2015-08-25" , "Got it" ])
        self.contracts.append([ "35" , "sujet contrat 35" , "9040408" , "2015-09-12" , "No" ])
        self.contracts.append([ "36" , "sujet contrat 36" , "1847095" , "2015-09-08" , "No" ])
        self.contracts.append([ "37" , "sujet contrat 37" , "34904" , "2015-01-06" , "Got it" ])
        self.contracts.append([ "38" , "sujet contrat 38" , "6302683" , "2015-02-16" , "Got it" ])
        self.contracts.append([ "39" , "sujet contrat 39" , "4312860" , "2015-10-16" , "No" ])
        self.contracts.append([ "40" , "sujet contrat 40" , "4942486" , "2015-04-23" , "No" ])
        self.contracts.append([ "41" , "sujet contrat 41" , "6962616" , "2015-04-22" , "Got it" ])
        self.contracts.append([ "42" , "sujet contrat 42" , "3589185" , "2015-09-22" , "No" ])
        self.contracts.append([ "43" , "sujet contrat 43" , "7753760" , "2015-10-22" , "May be" ])
        self.contracts.append([ "44" , "sujet contrat 44" , "956346" , "2015-01-17" , "Got it" ])
        self.contracts.append([ "45" , "sujet contrat 45" , "7449369" , "2015-02-11" , "May be" ])
        self.contracts.append([ "46" , "sujet contrat 46" , "6551019" , "2015-04-11" , "Good" ])
        self.contracts.append([ "47" , "sujet contrat 47" , "2729921" , "2015-11-07" , "Good" ])
        self.contracts.append([ "48" , "sujet contrat 48" , "1113975" , "2015-01-04" , "No" ])
        self.contracts.append([ "49" , "sujet contrat 49" , "2126062" , "2015-11-06" , "No" ])
        self.contracts.append([ "50" , "sujet contrat 50" , "8544386" , "2015-11-15" , "May be" ])
        self.contracts.append([ "51" , "sujet contrat 51" , "246776" , "2015-07-17" , "May be" ])
        self.contracts.append([ "52" , "sujet contrat 52" , "2195428" , "2015-10-09" , "Good" ])
        self.contracts.append([ "53" , "sujet contrat 53" , "597789" , "2015-03-20" , "No" ])
        self.contracts.append([ "54" , "sujet contrat 54" , "4006770" , "2015-04-13" , "Good" ])
    }
    func viderContracts() {
        self.contracts = [[ "1" , "sujet contrat 1" , "9397866" , "2015-08-20" , "Got it" ]]
    }
    
    var accountContracts = [[ "26" , "27" ]]
    func remplirAccountContracts() {
        self.accountContracts.append([ "25" , "27" ])
        self.accountContracts.append([ "29" , "27" ])
        self.accountContracts.append([ "4" , "21" ])
        self.accountContracts.append([ "24" , "22" ])
        self.accountContracts.append([ "23" , "34" ])
        self.accountContracts.append([ "12" , "4" ])
        self.accountContracts.append([ "19" , "14" ])
        self.accountContracts.append([ "40" , "22" ])
        self.accountContracts.append([ "38" , "39" ])
        self.accountContracts.append([ "26" , "18" ])
        self.accountContracts.append([ "8" , "34" ])
        self.accountContracts.append([ "37" , "23" ])
        self.accountContracts.append([ "33" , "28" ])
        self.accountContracts.append([ "32" , "11" ])
        self.accountContracts.append([ "40" , "27" ])
        self.accountContracts.append([ "28" , "11" ])
        self.accountContracts.append([ "9" , "10" ])
        self.accountContracts.append([ "23" , "10" ])
        self.accountContracts.append([ "19" , "17" ])
        self.accountContracts.append([ "17" , "35" ])
        self.accountContracts.append([ "38" , "35" ])
        self.accountContracts.append([ "5" , "7" ])
        self.accountContracts.append([ "22" , "1" ])
        self.accountContracts.append([ "35" , "38" ])
        self.accountContracts.append([ "19" , "3" ])
        self.accountContracts.append([ "15" , "24" ])
        self.accountContracts.append([ "18" , "32" ])
        self.accountContracts.append([ "12" , "3" ])
        self.accountContracts.append([ "23" , "32" ])
        self.accountContracts.append([ "24" , "11" ])
        self.accountContracts.append([ "10" , "30" ])
        self.accountContracts.append([ "34" , "26" ])
        self.accountContracts.append([ "25" , "7" ])
        self.accountContracts.append([ "13" , "33" ])
        self.accountContracts.append([ "36" , "3" ])
        self.accountContracts.append([ "26" , "35" ])
        self.accountContracts.append([ "25" , "34" ])
        self.accountContracts.append([ "37" , "4" ])
        self.accountContracts.append([ "34" , "22" ])
        self.accountContracts.append([ "3" , "14" ])
        self.accountContracts.append([ "21" , "18" ])
        self.accountContracts.append([ "36" , "39" ])
        self.accountContracts.append([ "30" , "10" ])
        self.accountContracts.append([ "22" , "36" ])
        self.accountContracts.append([ "7" , "30" ])
        self.accountContracts.append([ "38" , "10" ])
        self.accountContracts.append([ "23" , "18" ])
        self.accountContracts.append([ "20" , "1" ])
        self.accountContracts.append([ "25" , "29" ])
        self.accountContracts.append([ "2" , "12" ])
        self.accountContracts.append([ "20" , "8" ])
        self.accountContracts.append([ "1" , "1" ])
        self.accountContracts.append([ "8" , "16" ])
    }
    func viderAccountContracts() {
        self.accountContracts = [[ "26" , "27" ]]
    }
    
    var tasks = [[ "1" , "sujet task 1" , "2015-07-02" , "Got it" ]]
    func remplirTasks(){
        self.tasks.append([ "2" , "sujet task 2" , "2015-23-26" , "No" ])
        self.tasks.append([ "3" , "sujet task 3" , "2015-05-25" , "No" ])
        self.tasks.append([ "4" , "sujet task 4" , "2015-19-18" , "No" ])
        self.tasks.append([ "5" , "sujet task 5" , "2015-18-06" , "Good" ])
        self.tasks.append([ "6" , "sujet task 6" , "2015-12-01" , "May be" ])
        self.tasks.append([ "7" , "sujet task 7" , "2015-27-10" , "No" ])
        self.tasks.append([ "8" , "sujet task 8" , "2015-25-22" , "Got it" ])
        self.tasks.append([ "9" , "sujet task 9" , "2015-15-01" , "Good" ])
        self.tasks.append([ "10" , "sujet task 10" , "2015-28-02" , "May be" ])
        self.tasks.append([ "11" , "sujet task 11" , "2015-27-18" , "No" ])
        self.tasks.append([ "12" , "sujet task 12" , "2015-15-24" , "No" ])
        self.tasks.append([ "13" , "sujet task 13" , "2015-15-26" , "No" ])
        self.tasks.append([ "14" , "sujet task 14" , "2015-06-25" , "No" ])
        self.tasks.append([ "15" , "sujet task 15" , "2015-10-20" , "Got it" ])
        self.tasks.append([ "16" , "sujet task 16" , "2015-02-17" , "No" ])
        self.tasks.append([ "17" , "sujet task 17" , "2015-01-08" , "Good" ])
        self.tasks.append([ "18" , "sujet task 18" , "2015-24-02" , "Good" ])
        self.tasks.append([ "19" , "sujet task 19" , "2015-22-16" , "May be" ])
        self.tasks.append([ "20" , "sujet task 20" , "2015-27-08" , "Good" ])
        self.tasks.append([ "21" , "sujet task 21" , "2015-12-07" , "Got it" ])
        self.tasks.append([ "22" , "sujet task 22" , "2015-17-27" , "Good" ])
        self.tasks.append([ "23" , "sujet task 23" , "2015-23-08" , "No" ])
        self.tasks.append([ "24" , "sujet task 24" , "2015-07-09" , "May be" ])
        self.tasks.append([ "25" , "sujet task 25" , "2015-07-12" , "May be" ])
        self.tasks.append([ "26" , "sujet task 26" , "2015-23-21" , "May be" ])
        self.tasks.append([ "27" , "sujet task 27" , "2015-23-03" , "No" ])
        self.tasks.append([ "28" , "sujet task 28" , "2015-27-18" , "May be" ])
        self.tasks.append([ "29" , "sujet task 29" , "2015-10-23" , "Good" ])
        self.tasks.append([ "30" , "sujet task 30" , "2015-09-05" , "No" ])
        self.tasks.append([ "31" , "sujet task 31" , "2015-15-06" , "Got it" ])
        self.tasks.append([ "32" , "sujet task 32" , "2015-08-07" , "Good" ])
        self.tasks.append([ "33" , "sujet task 33" , "2015-07-16" , "No" ])
        self.tasks.append([ "34" , "sujet task 34" , "2015-07-20" , "Got it" ])
        self.tasks.append([ "35" , "sujet task 35" , "2015-20-10" , "Good" ])
        self.tasks.append([ "36" , "sujet task 36" , "2015-04-27" , "No" ])
        self.tasks.append([ "37" , "sujet task 37" , "2015-13-14" , "No" ])
        self.tasks.append([ "38" , "sujet task 38" , "2015-01-12" , "Got it" ])
        self.tasks.append([ "39" , "sujet task 39" , "2015-09-24" , "Good" ])
        self.tasks.append([ "40" , "sujet task 40" , "2015-14-09" , "Good" ])
        self.tasks.append([ "41" , "sujet task 41" , "2015-07-12" , "Good" ])
        self.tasks.append([ "42" , "sujet task 42" , "2015-08-08" , "May be" ])
        self.tasks.append([ "43" , "sujet task 43" , "2015-16-22" , "Got it" ])
        self.tasks.append([ "44" , "sujet task 44" , "2015-03-21" , "No" ])
        self.tasks.append([ "45" , "sujet task 45" , "2015-15-27" , "Got it" ])
        self.tasks.append([ "46" , "sujet task 46" , "2015-03-08" , "Got it" ])
        self.tasks.append([ "47" , "sujet task 47" , "2015-12-08" , "Good" ])
        self.tasks.append([ "48" , "sujet task 48" , "2015-14-12" , "Got it" ])
        self.tasks.append([ "49" , "sujet task 49" , "2015-24-24" , "No" ])
        self.tasks.append([ "50" , "sujet task 50" , "2015-17-16" , "Good" ])
        self.tasks.append([ "51" , "sujet task 51" , "2015-12-18" , "No" ])
        self.tasks.append([ "52" , "sujet task 52" , "2015-15-22" , "Got it" ])
        self.tasks.append([ "53" , "sujet task 53" , "2015-08-25" , "Good" ])
        self.tasks.append([ "54" , "sujet task 54" , "2015-04-04" , "Got it" ])
    }
    func viderTasks() {
        self.tasks = [[ "1" , "sujet task 1" , "2015-07-02" , "Got it" ]]
    }
    
    var accountTasks = [[ "5" , "8" ]]
    func remplirAccountTasks(){
        self.accountTasks.append([ "23" , "32" ])
        self.accountTasks.append([ "10" , "30" ])
        self.accountTasks.append([ "1" , "17" ])
        self.accountTasks.append([ "33" , "30" ])
        self.accountTasks.append([ "4" , "11" ])
        self.accountTasks.append([ "13" , "36" ])
        self.accountTasks.append([ "32" , "1" ])
        self.accountTasks.append([ "26" , "37" ])
        self.accountTasks.append([ "24" , "33" ])
        self.accountTasks.append([ "6" , "5" ])
        self.accountTasks.append([ "4" , "9" ])
        self.accountTasks.append([ "34" , "11" ])
        self.accountTasks.append([ "2" , "1" ])
        self.accountTasks.append([ "19" , "17" ])
        self.accountTasks.append([ "12" , "23" ])
        self.accountTasks.append([ "4" , "13" ])
        self.accountTasks.append([ "23" , "16" ])
        self.accountTasks.append([ "2" , "12" ])
        self.accountTasks.append([ "26" , "4" ])
        self.accountTasks.append([ "11" , "36" ])
        self.accountTasks.append([ "20" , "29" ])
        self.accountTasks.append([ "24" , "20" ])
        self.accountTasks.append([ "29" , "17" ])
        self.accountTasks.append([ "1" , "38" ])
        self.accountTasks.append([ "37" , "17" ])
        self.accountTasks.append([ "14" , "32" ])
        self.accountTasks.append([ "33" , "32" ])
        self.accountTasks.append([ "25" , "32" ])
        self.accountTasks.append([ "38" , "32" ])
        self.accountTasks.append([ "13" , "29" ])
        self.accountTasks.append([ "32" , "22" ])
        self.accountTasks.append([ "27" , "40" ])
        self.accountTasks.append([ "28" , "21" ])
        self.accountTasks.append([ "33" , "3" ])
        self.accountTasks.append([ "4" , "12" ])
        self.accountTasks.append([ "28" , "7" ])
        self.accountTasks.append([ "38" , "30" ])
        self.accountTasks.append([ "27" , "35" ])
        self.accountTasks.append([ "14" , "8" ])
        self.accountTasks.append([ "37" , "8" ])
        self.accountTasks.append([ "26" , "30" ])
        self.accountTasks.append([ "39" , "22" ])
        self.accountTasks.append([ "24" , "9" ])
        self.accountTasks.append([ "25" , "17" ])
        self.accountTasks.append([ "15" , "13" ])
        self.accountTasks.append([ "36" , "12" ])
        self.accountTasks.append([ "29" , "37" ])
        self.accountTasks.append([ "18" , "2" ])
        self.accountTasks.append([ "10" , "34" ])
        self.accountTasks.append([ "16" , "33" ])
        self.accountTasks.append([ "1" , "11" ])
        self.accountTasks.append([ "36" , "11" ])
        self.accountTasks.append([ "34" , "26" ])
    }
    func viderAccountTasks(){
        self.accountTasks = [[ "5" , "8" ]]
    }
    
    var contactTasks = [[ "28" , "3" ]]
    func remplirContactTasks(){
        self.contactTasks.append([ "3" , "40" ])
        self.contactTasks.append([ "18" , "12" ])
        self.contactTasks.append([ "23" , "8" ])
        self.contactTasks.append([ "30" , "3" ])
        self.contactTasks.append([ "6" , "21" ])
        self.contactTasks.append([ "11" , "30" ])
        self.contactTasks.append([ "34" , "35" ])
        self.contactTasks.append([ "33" , "19" ])
        self.contactTasks.append([ "37" , "6" ])
        self.contactTasks.append([ "17" , "1" ])
        self.contactTasks.append([ "28" , "31" ])
        self.contactTasks.append([ "11" , "26" ])
        self.contactTasks.append([ "23" , "1" ])
        self.contactTasks.append([ "12" , "36" ])
        self.contactTasks.append([ "10" , "15" ])
        self.contactTasks.append([ "37" , "38" ])
        self.contactTasks.append([ "12" , "30" ])
        self.contactTasks.append([ "39" , "29" ])
        self.contactTasks.append([ "12" , "33" ])
        self.contactTasks.append([ "9" , "40" ])
        self.contactTasks.append([ "32" , "40" ])
        self.contactTasks.append([ "35" , "20" ])
        self.contactTasks.append([ "6" , "9" ])
        self.contactTasks.append([ "6" , "7" ])
        self.contactTasks.append([ "17" , "16" ])
        self.contactTasks.append([ "30" , "6" ])
        self.contactTasks.append([ "3" , "9" ])
        self.contactTasks.append([ "30" , "13" ])
        self.contactTasks.append([ "8" , "34" ])
        self.contactTasks.append([ "36" , "10" ])
        self.contactTasks.append([ "21" , "37" ])
        self.contactTasks.append([ "15" , "16" ])
        self.contactTasks.append([ "3" , "31" ])
        self.contactTasks.append([ "5" , "15" ])
        self.contactTasks.append([ "30" , "15" ])
        self.contactTasks.append([ "17" , "27" ])
        self.contactTasks.append([ "12" , "29" ])
        self.contactTasks.append([ "21" , "9" ])
        self.contactTasks.append([ "30" , "2" ])
        self.contactTasks.append([ "7" , "17" ])
        self.contactTasks.append([ "24" , "22" ])
        self.contactTasks.append([ "23" , "3" ])
        self.contactTasks.append([ "34" , "3" ])
        self.contactTasks.append([ "17" , "9" ])
        self.contactTasks.append([ "36" , "8" ])
        self.contactTasks.append([ "38" , "25" ])
        self.contactTasks.append([ "19" , "5" ])
        self.contactTasks.append([ "31" , "36" ])
        self.contactTasks.append([ "18" , "16" ])
        self.contactTasks.append([ "7" , "25" ])
        self.contactTasks.append([ "39" , "13" ])
        self.contactTasks.append([ "17" , "28" ])
        self.contactTasks.append([ "21" , "11" ])
    }
    func viderContactTasks() {
        self.contactTasks = [[ "28" , "3" ]]
    }
    
    var taskMeetings =  [[ "28" , "3" ]]
    func remplirTaskMeetings(){
        self.taskMeetings.append([ "3" , "40" ])
        self.taskMeetings.append([ "18" , "12" ])
        self.taskMeetings.append([ "23" , "8" ])
        self.taskMeetings.append([ "30" , "3" ])
        self.taskMeetings.append([ "6" , "21" ])
        self.taskMeetings.append([ "11" , "30" ])
        self.taskMeetings.append([ "34" , "35" ])
        self.taskMeetings.append([ "33" , "19" ])
        self.taskMeetings.append([ "37" , "6" ])
        self.taskMeetings.append([ "17" , "1" ])
        self.taskMeetings.append([ "28" , "31" ])
        self.taskMeetings.append([ "11" , "26" ])
        self.taskMeetings.append([ "23" , "1" ])
        self.taskMeetings.append([ "12" , "36" ])
        self.taskMeetings.append([ "10" , "15" ])
        self.taskMeetings.append([ "37" , "38" ])
        self.taskMeetings.append([ "12" , "30" ])
        self.taskMeetings.append([ "39" , "29" ])
        self.taskMeetings.append([ "12" , "33" ])
        self.taskMeetings.append([ "9" , "40" ])
        self.taskMeetings.append([ "32" , "40" ])
        self.taskMeetings.append([ "35" , "20" ])
        self.taskMeetings.append([ "6" , "9" ])
        self.taskMeetings.append([ "6" , "7" ])
        self.taskMeetings.append([ "17" , "16" ])
        self.taskMeetings.append([ "30" , "6" ])
        self.taskMeetings.append([ "3" , "9" ])
        self.taskMeetings.append([ "30" , "13" ])
        self.taskMeetings.append([ "8" , "34" ])
        self.taskMeetings.append([ "36" , "10" ])
        self.taskMeetings.append([ "21" , "37" ])
        self.taskMeetings.append([ "15" , "16" ])
        self.taskMeetings.append([ "3" , "31" ])
        self.taskMeetings.append([ "5" , "15" ])
        self.taskMeetings.append([ "30" , "15" ])
        self.taskMeetings.append([ "17" , "27" ])
        self.taskMeetings.append([ "12" , "29" ])
        self.taskMeetings.append([ "21" , "9" ])
        self.taskMeetings.append([ "30" , "2" ])
        self.taskMeetings.append([ "7" , "17" ])
        self.taskMeetings.append([ "24" , "22" ])
        self.taskMeetings.append([ "23" , "3" ])
        self.taskMeetings.append([ "34" , "3" ])
        self.taskMeetings.append([ "17" , "9" ])
        self.taskMeetings.append([ "36" , "8" ])
        self.taskMeetings.append([ "38" , "25" ])
        self.taskMeetings.append([ "19" , "5" ])
        self.taskMeetings.append([ "31" , "36" ])
        self.taskMeetings.append([ "18" , "16" ])
        self.taskMeetings.append([ "7" , "25" ])
        self.taskMeetings.append([ "39" , "13" ])
        self.taskMeetings.append([ "17" , "28" ])
        self.taskMeetings.append([ "21" , "11" ])
    }
    func viderTaksMeetings() {
        self.taskMeetings =  [[ "28" , "3" ]]
    }

}