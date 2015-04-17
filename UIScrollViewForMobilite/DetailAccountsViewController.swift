//
//  DetailAccountsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 30/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class DetailAccountsViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var showList: UIView!
    @IBOutlet weak var containerView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var listeButtonsForPages: UIView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var identifiers: [String] = ["Meetings", "Vue 360°", "Contacts"]
    // Manque 'Next actions', 'Account Details', 'Pipe', 'Relation Activity'
    var meetingsOfAccount: MeetingsOfAccountViewController = MeetingsOfAccountViewController()
    var vue360: Vue360ViewController = Vue360ViewController()
    var contactsOfAccount: ContactsOfAccountViewController = ContactsOfAccountViewController()
    var pageControllers: [UIViewController] = []
    var pageViews: [UIView] = []
    var firstPage = 1
    var account: AccountModel!
    var viewDidItsLayout: Bool = false
    
    @IBOutlet var buttonPages: [UIButton] = []
    
    // here we define the buttons in the top menu, add the pan gesture to show our list
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.showList.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        buttonForPages(listeButtonsForPages)
        if account == nil {
            account = AccountDataModel().accountOfNextMeeting()
        }
        if account != nil {
            self.navigationBar.title = account.nameAccount
        }
        colorButtons(firstPage)
    }
    
    // every action that has relation to the layout of the view has to be put in here
    // here we get the viewControllers, their views, define which page we want first shown and define their content size
    override func viewDidLayoutSubviews() {
        if !viewDidItsLayout {
            
            pageControllers = getViewControllers()
            pageViews = getViews(pageControllers)
            
            
            let pageCount = pageControllers.count
            loadVisiblePages(pageCount)
            pageControl.numberOfPages = pageCount
            
            showPage(firstPage)
            
            let pageScrollViewSize = containerView.frame.size
            containerView.contentSize = CGSize(width: pageScrollViewSize.width * CGFloat(pageCount), height: pageScrollViewSize.height)
            viewDidItsLayout = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // get all the viewControllers that have identifiers defined in var identifiers
    func getViewControllers() -> [UIViewController]{
        var viewControllers: [UIViewController] = [UIViewController]()
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[0]) as? MeetingsOfAccountViewController {
            viewControllers.append(viewController)
            self.meetingsOfAccount = viewController
            self.meetingsOfAccount.account = self.account
        }
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[1]) as? Vue360ViewController {
            viewControllers.append(viewController)
            self.vue360 = viewController
            vue360.account = self.account
        }
        if let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifiers[2]) as? ContactsOfAccountViewController {
            viewControllers.append(viewController)
            self.contactsOfAccount = viewController
            self.contactsOfAccount.account = self.account
        }
        return viewControllers
    }
    
    // from the controllers that we set up earlier, we get their views and show them
    func getViews(viewControllers: [UIViewController]) -> [UIView] {
        var views: [UIView] = []
        for viewController in viewControllers {
            if let view = viewController.view as UIView? {
                views.append(view)
            }
        }
        return views
    }
    
    // load the pages that we want shown
    func loadVisiblePages(numberOfPages: Int) {
        let pageSize = containerView.bounds
        var pageBoundsForViews = pageSize
        
        for i in 0..<numberOfPages {
            pageBoundsForViews.origin.x = CGFloat(i) * pageSize.width
            let newPageView = pageViews[i]
            newPageView.frame = pageBoundsForViews
            containerView.addSubview(newPageView)
        }
    }
    
    // action added to the buttons of the menu to show a specific page
    @IBAction func goPage(sender: UIButton) {
        let textLabel = sender.titleLabel?.text
        var index = find(buttonPages, sender)
        if let index = index {
            showPage(index)
        }
    }
    
    // show the page that we want seen and updates the pageControl's shown page
    func showPage(page: Int) {
        let  pageSize = containerView.bounds
        let xContentOffset = pageSize.width * CGFloat(page)
        containerView.setContentOffset(CGPoint(x: xContentOffset, y: 0), animated: false)
//        pageControl.currentPage = page
    }
    
    // delegate method of scrollview : called everytime the scrollView is scrolled and update the pageControl's shown page
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        colorButtons(page)
        pageControl.currentPage = page
        self.vue360.updateAccount()
        self.view.endEditing(true)
    }
    
    // action to show the list of accounts
    @IBAction func showList(sender: UIBarButtonItem) {
        self.revealViewController().revealToggle(sender)
        vue360.updateAccount()
    }
    @IBAction func showList(sender: UITapGestureRecognizer) {
        self.revealViewController().revealToggle(sender)
        vue360.updateAccount()
    }
    
    // creates the button to add to the view
    func buttonForPages(view: UIView) {
        let frame = view.frame
        var i = 0
        let width = CGFloat(100)
        for identifier in identifiers {
            let button = UIButton(frame: CGRect(x: CGFloat(i) * width, y: 0, width: 92, height: 37))
            button.setTitle(identifier, forState: UIControlState.Normal)
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            button.addTarget(self, action: Selector("goPage:"), forControlEvents: UIControlEvents.TouchUpInside)
            button.layer.cornerRadius = 8
            view.addSubview(button)
            buttonPages.append(button)
            
            i++
        }
    }
    
    // colorier les boutons avec la couleur choisie
    func colorButtons(page:Int) {
        for button in buttonPages {
            button.backgroundColor = blueUncheckedColor
        }
        buttonPages[page].backgroundColor = blueCheckedColor
    }
}
