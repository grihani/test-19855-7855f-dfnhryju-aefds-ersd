//
//  OpportunitiesOfAccountViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 22/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class OpportunitiesOfAccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var account: AccountModel!
    var opportunitiesOfAccount: [OpportunityModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.opportunitiesOfAccount = OpportunityDataModel().opportunitiesOfAccount(account: self.account)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Mark: - TableView Data Source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opportunitiesOfAccount.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("opportunityOfAccount") as UITableViewCell
        let row = indexPath.row
        let opportunity = self.opportunitiesOfAccount[row]
        cell.textLabel?.text = String(opportunity.percentageOpportunity) + "% : " + opportunity.nomOpportunite
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
