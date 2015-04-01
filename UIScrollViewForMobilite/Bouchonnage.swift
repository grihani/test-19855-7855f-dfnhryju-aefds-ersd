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
    func insertingAccounts () {
        var successful = ""
        let accountsToInsert = remplirTableauAccount()
        for accountToInsert in accountsToInsert {
            successful += AccountDataModel().insertAccount(accountToInsert)
            successful += "\n"
        }
        println(successful)
    }
}